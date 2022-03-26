/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

public extension ScryfallApi {
    struct ManaCost: Equatable, Codable {
        /// The normalized cost, with correctly-ordered and wrapped mana symbols.
        public let cost: String
        /// The converted mana cost. If you submit Un-set mana symbols, this decimal could include fractional parts.
        public let cmc: Double
        /// The colors of the given cost. Complete list at https://scryfall.com/docs/api/colors
        public let colors: [String]
        /// True if the cost is colorless.
        public let colorless: Bool
        /// True if the cost is monocolored.
        public let monocolored: Bool
        /// True if the cost is multicolored.
        public let multicolored: Bool
    }
}
