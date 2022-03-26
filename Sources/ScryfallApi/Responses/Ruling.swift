/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import Foundation

public extension ScryfallApi {
    struct Ruling: Equatable, Codable {
        /// A unique ID for the oracle identity of the card this ruling is for.
        public let oracle_id: UUID
        /// A computer-readable string indicating which company produced this ruling, either wotc or scryfall.
        public let source: String
        /// The date when the ruling or note was published.
        public let published_at: String
        /// The text of the ruling.
        public let comment: String
    }
}
