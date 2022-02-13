//
//  GetRandomCard.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct GetRandomCard: ScryfallRequest {
        public typealias Response = Card
        public let path = "/cards/random"
        public let queryItems: [URLQueryItem]
        public let httpMethod: HTTPMethod = .GET

        /// Query for a single random card. The random card pool can be filtered.
        ///
        /// - Parameter filter: A fulltext entry to filter the pool of random cards.
        public init(filter: String? = nil) {
            self.queryItems = [
                URLQueryItem(name: "q", value: filter)
            ]
        }
    }
}
