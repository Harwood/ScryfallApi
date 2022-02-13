//
//  GetAllSets.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct GetAllSets: ScryfallRequest {
        public typealias Response = Page<Set>
        public let path = "/sets"
        public let queryItems: [URLQueryItem] = []
        public let httpMethod: HTTPMethod = .GET

        /// Query a page containing all sets on Scryfall.
        public init() {}
    }
}
