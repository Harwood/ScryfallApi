//
//  GetCatalog.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct GetCatalog: ScryfallRequest {
        public typealias Response = Catalog
        public let path: String
        public let queryItems: [URLQueryItem] = []
        public let httpMethod: HTTPMethod = .GET

        public enum Input: String, Equatable {
            case cardNames = "card-names"
            case artistNames = "artist-names"
            case wordBank = "word-bank"
            case creatureTypes = "creature-types"
            case planeswalkerTypes = "planeswalker-types"
            case landTypes = "land-types"
            case artifactTypes = "artifact-types"
            case enchantmentTypes = "enchantment-types"
            case spellTypes = "spell-types"
            case powers
            case toughnesses
            case loyalties
            case watermarks
            case keywordAbilities = "keyword-abilities"
            case keywordActions = "keyword-actions"
            case abilityWords = "ability-words"
        }

        /// Query for a single catalog in Scryfall’s database.
        ///
        /// - Important: Values are updated as soon as a new card is entered for spoiler seasons.
        /// - Parameter input: Input representing the catalog to query for.
        public init(input: Input) {
            self.path = "/catalog/\(input.rawValue)"
        }
    }
}
