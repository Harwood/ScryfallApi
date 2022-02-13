//
//  GetSet.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct GetSet: ScryfallRequest {
        public typealias Response = Set
        public let path: String
        public let queryItems: [URLQueryItem] = []
        public let httpMethod: HTTPMethod = .GET

        public enum Identifier: Equatable {
            /// Get a set with its Scryfall `id`.
            case scryfall(UUID)
            /// Get a set with its `tcgplayer_id`.
            case tcgplayer(Int)

            var path: String {
                switch self {
                case let .scryfall(id):
                    return "/sets/\(id.uuidString)"
                case let .tcgplayer(id):
                    return "/sets/\(id)"
                }
            }
        }

        /// Query for a single set with the given identifier
        ///
        /// - Parameter identifier: The set's unique identifier, supported for lookup on the Scryfall API.
        public init(identifier: Identifier) {
            self.path = identifier.path
        }

        /// Query for a single set with the given set code.
        ///
        /// - Parameter setCode: The unique three to five-letter code for this set.
        public init(setCode: String) {
            self.path = "/sets/\(setCode)"
        }
    }
}
