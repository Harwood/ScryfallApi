//
//  Scryfall.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public protocol Scryfall {
    /// Execute a single `ScryfallRequest`.
    /// - Parameter request: A request to be executed.
    func execute<T: ScryfallRequest>(request: T) async throws -> T.Response

    /// Execute multiple `ScryfallRequest`s. This function does not return until all requests have completed.
    /// - Parameter requests: A list of requests to be executed.
    func execute<T: ScryfallRequest>(requests: [T]) async throws -> [T.Response]
}

public final class ScryfallContainer: Scryfall {

    public init() {}

    public func execute<T: ScryfallRequest>(request: T) async throws -> T.Response {
        guard let url = request.url else {
            throw ScryfallError<T>.invalidRequest(request)
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        if let response = try? JSONDecoder().decode(T.Response.self, from: data) {
            return response
        } else if let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
            // The Scryfall Api returned a search error object in the data response.
            // This is likely a 404 indicating that the query was ambiguous, no results found, etc.
            throw ScryfallError<T>.apiResponse(errorResponse)
        } else {
            throw ScryfallError<T>.invalidResponse
        }
    }

    public func execute<T: ScryfallRequest>(requests: [T]) async throws -> [T.Response] {
        try await withThrowingTaskGroup(of: T.Response.self) { group in
            for request in requests {
                group.addTask {
                    return try await self.execute(request: request)
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
