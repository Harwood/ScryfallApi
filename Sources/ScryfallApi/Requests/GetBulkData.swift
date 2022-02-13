//
//  GetBulkData.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct GetBulkData: ScryfallRequest {
        public typealias Response = BulkData
        public let path: String
        public let queryItems: [URLQueryItem] = []
        public let httpMethod: HTTPMethod = .GET

        /// Query for bulk data with the given ID.
        ///
        /// - Important: Valid bulk data IDs can be retrieved from executing the `GetAllBulkData` request.
        /// - Parameter id: The unique ID of the bulk data.
        public init(id: UUID) {
            self.path = "/bulk-data/\(id.uuidString)"
        }

        /// Query for bulk data with the given type.
        ///
        /// - Important: Valid bulk data types can be retrieved from executing the `GetAllBulkData` request.
        /// - Parameter type: The type of bulk data to query.
        public init(type: String) {
            self.path = "/bulk-data/\(type)"
        }
    }
}
