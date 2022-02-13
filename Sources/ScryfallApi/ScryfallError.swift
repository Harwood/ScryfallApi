//
//  ScryfallError.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

public enum ScryfallError<T: ScryfallRequest>: Error, CustomDebugStringConvertible {
    case apiResponse(ErrorResponse)
    case invalidRequest(T)
    case invalidResponse

    public var debugDescription: String {
        switch self {
        case let .apiResponse(error):
            return error.debugDescription
        case let .invalidRequest(request):
            return "Could not construct URL. Please confirm your path & query items are formatted correctly.\n\(request)"
        case .invalidResponse:
            return "Could not decode response. An unsupported resource may have been requested. Please ping us @ https://discord.gg/BSBWBsvMGc"
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
