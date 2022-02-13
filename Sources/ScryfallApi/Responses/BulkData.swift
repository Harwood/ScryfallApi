//
//  BulkData.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct BulkData: Equatable, Codable {
        /// A unique ID for this bulk item.
        public let id: UUID
        /// The Scryfall API URI for this file.
        public let uri: URL
        /// A computer-readable string for the kind of bulk item.
        public let type: String
        /// A human-readable name for this file.
        public let name: String
        /// A human-readable description for this file.
        public let description: String
        /// The URI that hosts this bulk file for fetching.
        public let download_uri: URL
        /// The time when this file was last updated.
        public let timestamp: String
        /// The size of this file in integer bytes.
        public let compressed_size: Int
        /// The MIME type of this file.
        public let content_type: String
        /// The Content-Encoding encoding that will be used to transmit this file when you download it.
        public let content_encoding: String
    }
}
