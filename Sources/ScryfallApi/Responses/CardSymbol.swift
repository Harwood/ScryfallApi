//
//  CardSymbol.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct CardSymbol: Equatable, Codable {
        /// The plaintext symbol. Often surrounded with curly braces {}. Note that not all symbols are ASCII text (for example, {∞}).
        public let symbol: String
        /// An alternate version of this symbol, if it is possible to write it without curly braces.
        public let loose_variant: String?
        /// An English snippet that describes this symbol. Appropriate for use in alt text or other accessible communication formats.
        public let english: String
        /// True if it is possible to write this symbol “backwards”. For example, the official symbol {U/P} is sometimes written as {P/U} or {P\U} in informal settings. Note that the Scryfall API never writes symbols backwards in other responses. This field is provided for informational purposes.
        public let transposable: Bool
        /// True if this is a mana symbol.
        public let represents_mana: Bool
        /// A decimal number representing this symbol’s converted mana cost. Note that mana symbols from funny sets can have fractional converted mana costs.
        public let cmc: Double?
        /// True if this symbol appears in a mana cost on any Magic card. For example {20} has this field set to false because {20} only appears in Oracle text, not mana costs.
        public let appears_in_mana_costs: Bool
        /// True if this symbol is only used on funny cards or Un-cards.
        public let funny: Bool
        /// An array of colors that this symbol represents.
        public let colors: [String]
        /// An array of plaintext versions of this symbol that Gatherer uses on old cards to describe original printed text. For example: {W} has ["oW", "ooW"] as alternates.
        public let gatherer_alternates: String?
        /// A URI to an SVG image of this symbol on Scryfall’s CDNs.
        public let svg_uri: URL?
    }
}
