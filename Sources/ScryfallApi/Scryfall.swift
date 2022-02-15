//
//  Scryfall.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public protocol ScryfallSession {
    /// Send a single ScryfallRequest to the Scryfall API.
    ///
    /// - Important: Scryfall asks that you insert 50 – 100 milliseconds of delay between each request that you send. Submitting excessive requests to the server may result in a HTTP 429 Too Many Requests status code.
    /// - Parameter request: A ScryfallRequest that provides request-specific information such as the URL and body data.
    /// - Returns: An asynchronously-delivered ScryfallRequest.Response object for the completed ScryfallRequest.
    func send<T: ScryfallRequest>(request: T) async throws -> T.Response

    /// Send multiple ScryfallRequests to the Scryfall API. This function does not return until all requests have completed.
    ///
    /// - Important: Scryfall asks that you insert 50 – 100 milliseconds of delay between each request that you you send. Submitting excessive requests to the server may result in a HTTP 429 Too Many Requests status code.
    /// - Parameter requests: A list of ScryfallRequests that provide request-specific information such as the URL and body data.
    /// - Returns: An asynchronously-delivered list of ScryfallRequest.Response objects for each completed ScryfallRequest.
    func send<T: ScryfallRequest>(requests: [T]) async throws -> [T.Response]
}

protocol NetworkSession {
    /// Load data using a URLRequest, creates and resumes a URLSessionDataTask internally.
    ///
    /// - Parameter request: A URL request object that provides request-specific information such as the URL, cache policy, request type, and body data or body stream.
    /// - Returns: An asynchronously-delivered tuple that contains the URL contents as a Data instance, and a URLResponse.
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

private final class Session: NetworkSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await URLSession.shared.data(for: request)
    }
}

public final class Scryfall: ScryfallSession {
    private let networkSession: NetworkSession

    public convenience init() {
        self.init(networkSession: Session())
    }

    init(networkSession: NetworkSession) {
        self.networkSession = networkSession
    }

    public func send<T: ScryfallRequest>(request: T) async throws -> T.Response {
        let urlRequest = try request.makeURLRequest()
        let (data, _) = try await networkSession.data(for: urlRequest)

        if let response = try? JSONDecoder().decode(T.Response.self, from: data) {
            return response
        } else if let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
            // The Scryfall Api returned a search error object in the data response.
            // This is likely a 404 indicating that the query was ambiguous, no results found, etc.
            throw ScryfallError<T>.errorResponse(request, errorResponse)
        } else {
            throw ScryfallError<T>.unknownResponse(request)
        }
    }

    public func send<T: ScryfallRequest>(requests: [T]) async throws -> [T.Response] {
        try await withThrowingTaskGroup(of: T.Response.self) { group in
            for request in requests {
                group.addTask {
                    return try await self.send(request: request)
                }
            }
            var responses: [T.Response] = []
            for try await response in group {
                responses.append(response)
            }
            return responses
        }
    }
}
