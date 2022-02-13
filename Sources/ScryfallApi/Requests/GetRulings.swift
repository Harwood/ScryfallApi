//
//  GetRulings.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct GetRulings: ScryfallRequest {
        public typealias Response = Page<Ruling>
        public let path: String
        public let queryItems: [URLQueryItem] =  []
        public let httpMethod: HTTPMethod = .GET

        public enum Identifier: Equatable {
            /// Get the rulings for a card with its Scryfall `id`.
            case scryfall(UUID)
            /// Get the rulings for a card with its `arena_id`.
            case arena(Int)
            /// Get the rulings for a card with its `mtgo_id` or `mtgo_foil_id`.
            case mtgo(Int)
            /// Get the rulings for a card with one of its `multiverse_ids`.
            case multiverse(Int)

            var path: String {
                switch self {
                case let .scryfall(id):
                    return "/cards/\(id.uuidString)/rulings"
                case let .arena(id):
                    return "/cards/arena/\(id)/rulings"
                case let .mtgo(id):
                    return "/cards/mtgo/\(id)/rulings"
                case let .multiverse(id):
                    return "/cards/multiverse/\(id)/rulings"
                }
            }
        }

        /// Query for a page of rulings for a card with the given identifier.
        ///
        /// - Parameter identifier: The card's unique identifier, supported for lookup on the Scryfall API.
        public init(identifier: Identifier) {
            self.path = identifier.path
        }

        /// Query for a page of rulings for the card with the given set code and collector number.
        ///
        /// - Parameter setCode: The card's unique three to five-letter set code.
        /// - Parameter collectorNumber: The card's collector number.
        public init(setCode: String, collectorNumber: String) {
            self.path = "/cards/\(setCode)/\(collectorNumber)/rulings"
        }
    }
}
