//
//  GetCardCollection.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct GetCardCollection: ScryfallRequest {
        public typealias Response = Page<Card>
        public let path = "/cards/collection"
        public let queryItems: [URLQueryItem] = []
        public let httpMethod: HTTPMethod

        public struct Input: Equatable, Encodable {
            public enum Identifier: Equatable, Encodable {
                /// Find a card with a its Scryfall `id`.
                case scryfall(UUID)
                /// Find a card with its `mtgo_id` or `mtgo_foil_id`.
                case mtgo(Int)
                /// Find a card with one of its `multiverse_ids`.
                case multiverse(Int)
                /// Find the newest edition of a card with its `oracle_id`.
                case oracle(UUID)
                /// Find the preferred scans of a card with its `illustration_id`.
                case illustration(UUID)
                /// Find the newest edition of a card with the specified `name`.
                case name(String)
                /// Find a card matching the specified `name` and `set`.
                case nameSetCode(name: String, setCode: String)
                /// Find a card with the specified `collector_number` and `set`.
                case collectorNumberSetCode(collectorNumber: String, setCode: String)

                enum CodingKeys: String, CodingKey {
                    case id, mtgo_id, multiverse_id, oracle_id, illustration_id, name, set, collector_number
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    switch self {
                    case let .scryfall(id):
                        try container.encode(id, forKey: .id)
                    case let .mtgo(id):
                        try container.encode(id, forKey: .mtgo_id)
                    case let .multiverse(id):
                        try container.encode(id, forKey: .multiverse_id)
                    case let .oracle(id):
                        try container.encode(id, forKey: .oracle_id)
                    case let .illustration(id):
                        try container.encode(id, forKey: .illustration_id)
                    case let .name(name):
                        try container.encode(name, forKey: .name)
                    case let .nameSetCode(name, setCode):
                        try container.encode(name, forKey: .name)
                        try container.encode(setCode, forKey: .set)
                    case let .collectorNumberSetCode(collectorNumber, setCode):
                        try container.encode(collectorNumber, forKey: .collector_number)
                        try container.encode(setCode, forKey: .set)
                    }
                }
            }

            let identifiers: [Identifier]

            /// Each submitted card identifier must be a JSON object with one or more valid identifier schema combinations.
            /// Multiple identifier schemas may be included in a single request. Each identifier will return up to one card.
            ///
            /// - Important: Each POST at '/cards/collection' must contain *at most* 75 identifiers.
            /// If you have `75 > n <= Int.max` identifiers, group them into `ceiling(n / 75)` requests and send them using `send<T: ScryfallRequest>(requests: [T]) async throws -> [T.Response]`.
            /// - Parameter identifiers: A list of card identifiers to submit.
            public init(identifiers: [Identifier]) {
                self.identifiers = identifiers
            }
        }

        /// Query for page of cards with specific identifiers.
        ///
        /// - Important: Identifiers that are not found will be returned in the `not_found` field.
        /// - Parameter input: Contains a list of valid identifiers for a request.
        public init(input: Input) {
            self.httpMethod = .POST(
                httpBody: try? JSONEncoder().encode(input),
                contentType: "application/json"
            )
        }
    }
}
