/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

public enum ScryfallError<T: ScryfallOperation>: Error, Equatable, CustomDebugStringConvertible {
    case errorResponse(T, ErrorResponse)
    case invalidOperation(T)
    case unknownResponse(T)

    public var debugDescription: String {
        switch self {
        case let .errorResponse(operation, error):
            return "Scryfall request failed: \(operation)\n\(error.debugDescription)"
        case let .invalidOperation(operation):
            return "Could not construct URL. Please confirm your path & query items are formatted correctly.\n\(operation)"
        case let .unknownResponse(operation):
            return "Could not decode response. Please confirm your ScryfallOperation.Response type matches the expected response type from the Scryfall API.\n\(operation)"
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
