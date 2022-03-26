/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import Foundation

public extension ScryfallApi {
    struct GetAllCardSymbols: ScryfallRequest {
        public typealias Response = Page<BulkData>
        public let path = "/symbology"
        public let queryItems: [URLQueryItem] = []
        public let httpMethod: HTTPMethod = .GET

        /// Query a page containing all card symbols on Scryfall.
        public init() {}
    }
}
