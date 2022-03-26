/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}

enum JSONFixture: String {
    case bulkData
    case card
    case cardIdentifiers
    case cardSymbol
    case catalog
    case errorResponse
    case manaCost
    case mockResponse
    case page
    case ruling
    case set
    case unknownResponse
}

enum ResourceLoader {
    /// Read the contents of a JSON fixture file into a Data object.
    ///
    /// - Parameter jsonFixture: The JSON fixture file to read.
    /// - Returns: The Data contents of the JSON fixture file.
    static func data(for jsonFixture: JSONFixture) throws -> Data {
        guard let path = Bundle.module.path(forResource: jsonFixture.rawValue, ofType: "json") else {
            throw "Could not load JSON fixture with name: \(jsonFixture.rawValue).json"
        }
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
        return try JSONSerialization.data(withJSONObject: json, options: [])
    }
}
