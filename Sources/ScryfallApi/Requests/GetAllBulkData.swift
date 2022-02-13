//
//  GetAllBulkData.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct GetAllBulkData: ScryfallRequest {
        public typealias Response = Page<BulkData>
        public let path = "/bulk-data"
        public let queryItems: [URLQueryItem] = []
        public let httpMethod: HTTPMethod = .GET

        /// Query a page containing all bulk data on Scryfall.
        public init() {}
    }
}
