//
//  ScryfallRequest.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public typealias ScryfallRequest = ScryfallApiRequest & ResponseAssociable

public protocol ScryfallApiRequest {
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var httpMethod: HTTPMethod { get }
}

public enum HTTPMethod {
    case POST(httpBody: Data?, contentType: String)
    case GET
}

extension ScryfallApiRequest {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.scryfall.com"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }

    var urlRequest: URLRequest? {
        guard let url = url else { return nil }

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
