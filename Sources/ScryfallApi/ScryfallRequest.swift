//
//  ScryfallRequest.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public typealias ScryfallRequest = ScryfallApiRequest & ResponseAssociable & Equatable

public protocol ScryfallApiRequest {
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var httpMethod: HTTPMethod { get }
}

public enum HTTPMethod: Equatable {
    case POST(httpBody: Data?, contentType: String)
    case GET
}

extension ScryfallApiRequest where Self: ResponseAssociable & Equatable {
    func makeURL() throws -> URL {
        var components = URLComponents()
        components.scheme = ScryfallApi.scheme
        components.host = ScryfallApi.host
        components.path = path

        let queryItems = queryItems.filter { $0.value != nil }
        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }

        guard let url = components.url else {
            throw ScryfallError<Self>.invalidRequest(self)
        }
        return url
    }

    func makeURLRequest() throws -> URLRequest {
        let url = try makeURL()
        var request = URLRequest(url: url)

        switch httpMethod {
        case let .POST(httpBody, contentType):
            request.httpMethod = "POST"
            request.httpBody = httpBody
            request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        case .GET:
            request.httpMethod = "GET"
        }

        return request
    }
}

public protocol ResponseAssociable {
    associatedtype Response: Codable
}
