//
//  ParseManaCost.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct ParseManaCost: ScryfallRequest {
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
