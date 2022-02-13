//
//  SearchCards.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    enum OrderedBy: String, Equatable, Codable {
        case name, `set`, released, rarity, color, usd, tix, eur, cmc, power, toughness, edhrec, artist, review
    }

    enum Direction: String, Equatable, Codable {
        case auto, asc, desc
    }

    enum UniquedBy: String, Equatable, Codable {
        case cards, art, prints
    }

    struct SearchCards: ScryfallRequest {
        public typealias Response = Page<Card>
        public let path = "/cards/search"
        public let queryItems: [URLQueryItem]
        public let httpMethod: HTTPMethod = .GET

        /// Query for a paginated list of cards based on the given search term.
        ///
        /// - Parameter searchTerm: A fulltext search query with a maximum of 1000 Unicode characters.
        /// - Parameter orderedBy: The method to order the cards.
        /// - Parameter direction: The direction to sort the ordered cards.
        /// - Parameter uniquedBy: The strategy for omitting similar cards.
        /// - Parameter page: The page number to return.
        /// - Parameter includeExtras: If true, extra cards (tokens, planes, etc) will be included.
        /// - Parameter includeMultilingual: If true, cards in every language supported by Scryfall will be included.
        /// - Parameter includeVariations: If true, rare care variants will be included.
        public init(searchTerm: String, orderedBy: OrderedBy = .name, direction: Direction = .auto, uniquedBy: UniquedBy = .cards, page: Int = 1, includeExtras: Bool = false, includeMultilingual: Bool = false, includeVariations: Bool = false) {
            self.queryItems = [
                URLQueryItem(name: "q", value: searchTerm),
                URLQueryItem(name: "order", value: orderedBy.rawValue),
                URLQueryItem(name: "dir", value: direction.rawValue),
                URLQueryItem(name: "unique", value: uniquedBy.rawValue),
                URLQueryItem(name: "page", value: String(page)),
                URLQueryItem(name: "include_extras", value: String(includeExtras)),
                URLQueryItem(name: "include_multilingual", value: String(includeMultilingual)),
                URLQueryItem(name: "include_variations", value: String(includeVariations))
            ]
        }
    }
}
