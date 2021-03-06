/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import Foundation

public typealias ScryfallOperation = Operation & ResponseAssociable & Equatable

public protocol Operation {
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var httpMethod: HTTPMethod { get }
}

public enum HTTPMethod: Equatable {
    case POST(httpBody: Data?, contentType: String)
    case GET
}

extension Operation where Self: ResponseAssociable & Equatable {
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
            throw ScryfallError<Self>.invalidOperation(self)
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
    associatedtype Response: Equatable & Codable
}
