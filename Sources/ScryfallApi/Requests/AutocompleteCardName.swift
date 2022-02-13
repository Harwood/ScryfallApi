//
//  AutocompleteCardName.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct AutocompleteCardName: ScryfallRequest {
        public typealias Response = Catalog
        public let path = "/cards/autocomplete"
        public let queryItems: [URLQueryItem]
        public let httpMethod: HTTPMethod = .GET

        /// Query for a catalog of up to 20 full english card names that could be autocompletions of the candidate string.
        ///
        /// - Parameter candidate: The candidate string to autocomplete.
        /// - Parameter includeExtras: If true, extra cards (tokens, planes, vanguards, etc) will be included.
        public init(candidate: String, includeExtras: Bool = false) {
            self.queryItems = [
                URLQueryItem(name: "q", value: candidate),
                URLQueryItem(name: "include_extras", value: String(includeExtras))
            ]
        }
    }
}
