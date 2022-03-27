/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import Foundation

public extension ScryfallApi {
    struct GetAllSets: ScryfallOperation {
        public typealias Response = Page<Set>
        public let path = "/sets"
        public let queryItems: [URLQueryItem] = []
        public let httpMethod: HTTPMethod = .GET

        /// Query a page containing all sets on Scryfall.
        public init() {}
    }
}
