/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import Foundation

public extension ScryfallApi {
    struct GetAllBulkData: ScryfallOperation {
        public typealias Response = Page<BulkData>
        public let path = "/bulk-data"
        public let queryItems: [URLQueryItem] = []
        public let httpMethod: HTTPMethod = .GET

        /// Query a page containing all bulk data on Scryfall.
        public init() {}
    }
}
