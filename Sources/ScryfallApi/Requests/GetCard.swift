/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import Foundation

public extension ScryfallApi {
    struct GetCard: ScryfallRequest {
        public typealias Response = Card
        public let path: String
        public let queryItems: [URLQueryItem]
        public let httpMethod: HTTPMethod = .GET

        public enum Identifier: Equatable {
            /// Get a card with its Scryfall `id`.
            case scryfall(UUID)
            /// Get a card with its `arena_id`.
            case arena(Int)
            /// Get a card with its `cardmarket_id`.
            case cardmarket(Int)
            /// Get a card with its `mtgo_id` or `mtgo_foil_id`.
            case mtgo(Int)
            /// Get a card with one of its `multiverse_ids`.
            case multiverse(Int)
            /// Get a card with its `tcgplayer_id` or `tcgplayer_etched_id`.
            case tcgplayer(Int)

            var path: String {
                switch self {
                case let .scryfall(id):
                    return "/cards/\(id.uuidString)"
                case let .arena(id):
                    return "/cards/arena/\(id)"
                case let .cardmarket(id):
                    return "/cards/cardmarket/\(id)"
                case let .mtgo(id):
                    return "/cards/mtgo/\(id)"
                case let .multiverse(id):
                    return "/cards/multiverse/\(id)"
                case let .tcgplayer(id):
                    return "/cards/tcgplayer/\(id)"
                }
            }
        }

        /// Query for a single card with the given identifier.
        ///
        /// - Important: The newest edition of the card will be returned.
        /// - Parameter idenfitier: The card's unique identifier, supported for lookup on the Scryfall API.
        public init(identifier: Identifier) {
            self.path = identifier.path
            self.queryItems = []
        }

        /// Query for a single card with the given set code and collector number.
        /// Optionally append a lang part to the URL to retrieve a non-English version of the card.
        ///
        /// - Parameter setCode: A unique three to five-letter set code to limit the search to one set.
        /// - Parameter collectorNumber: The card's collector number.
        /// - Parameter language: The 2-3 character language code.
        public init(setCode: String, collectorNumber: String, language: String? = nil) {
            var path = "/cards/\(setCode)/\(collectorNumber)"
            if let language = language {
                path.append("/\(language)")
            }
            self.path = path
            self.queryItems = []
        }

        /// Query for a singe card based on an exact card name.
        ///
        /// - Important: If a set code is not provided, the newest edition of the card will be returned.
        /// - Parameter exactName: An exact card name to search for.
        /// - Parameter setCode: A unique three to five-letter set code to limit the search to one set.
        public init(exactName: String, setCode: String? = nil) {
            self.path = "/cards/named"
            self.queryItems = [
                URLQueryItem(name: "exact", value: exactName),
                URLQueryItem(name: "set", value: setCode)
            ]
        }

        /// Query for a singe card based on a fuzzy card name.
        ///
        /// - Important: If a set code is not provided, the newest edition of the card will be returned.
        /// - Parameter fuzzyName: A fuzzy card name to search for.
        /// - Parameter setCode: A unique three to five-letter set code to limit the search to one set.
        public init(fuzzyName: String, setCode: String? = nil) {
            self.path = "/cards/named"
            self.queryItems = [
                URLQueryItem(name: "fuzzy", value: fuzzyName),
                URLQueryItem(name: "set", value: setCode)
            ]
        }
    }
}
