/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import Foundation

public extension ScryfallApi {
    struct ParseManaCost: ScryfallOperation {
        public typealias Response = ManaCost
        public let path = "/symbology/parse-mana"
        public let queryItems: [URLQueryItem]
        public let httpMethod: HTTPMethod = .GET

        /// Parse the given mana cost and returns Scryfall’s interpretation.
        /// The server understands most community shorthand for mana costs.
        /// Symbols can also be out of order, lowercase, or have multiple colorless costs.
        ///
        /// - Parameter manaCost: The mana cost string to parse.
        public init(manaCost: String) {
            self.queryItems = [
                URLQueryItem(name: "cost", value: manaCost)
            ]
        }
    }
}
