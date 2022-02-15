//
//  ScryfallError.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

public enum ScryfallError<T: ScryfallRequest>: Error, Equatable, CustomDebugStringConvertible {
    case errorResponse(T, ErrorResponse)
    case invalidRequest(T)
    case unknownResponse(T)

    public var debugDescription: String {
        switch self {
        case let .errorResponse(request, error):
            return "Scryfall request failed: \(request)\n\(error.debugDescription)"
        case let .invalidRequest(request):
            return "Could not construct URL. Please confirm your path & query items are formatted correctly.\n\(request)"
        case let .unknownResponse(request):
            return "Could not decode response. Please confirm your ScryfallRequest.Response type matches the expected response type from the Scryfall API.\n\(request)"
        }
    }
}

public struct ErrorResponse: Equatable, Decodable, CustomDebugStringConvertible {
    public let code: String
    public let details: String
    public let status: Int
    public let warnings: [String]

    public var debugDescription: String {
        var debugDescription = "Scryfall Api returned \(status) (\(code)). \(details)"
        warnings.forEach { debugDescription.append("\n• \($0)") }
        return debugDescription
    }
}
