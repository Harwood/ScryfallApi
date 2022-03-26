/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import Foundation

public extension ScryfallApi {
    struct GetCatalog: ScryfallRequest {
        public typealias Response = Catalog
        public let path: String
        public let queryItems: [URLQueryItem] = []
        public let httpMethod: HTTPMethod = .GET

        public enum CatalogName: String, Equatable, CaseIterable {
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
        /// - Parameter catalogName: The name of the catalog to query for.
        public init(named catalogName: CatalogName) {
            self.path = "/catalog/\(catalogName.rawValue)"
        }
    }
}
