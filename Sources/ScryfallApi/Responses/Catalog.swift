//
//  Catalog.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct Catalog: Equatable, Codable {
        /// A link to the current catalog on Scryfall’s API.
        public let uri: URL
        /// The number of items in the data array.
        public let total_values: Int
        /// The datapoints in this catalog.
        public let data: [String]
    }
}
