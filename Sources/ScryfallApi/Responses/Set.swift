//
//  Set.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct Set: Equatable, Codable {
        /// A unique ID for this set on Scryfall that will not change.
        public let id: UUID
        /// The unique three to five-letter code for this set.
        public let code: String
        /// The unique code for this set on MTGO, which may differ from the regular code.
        public let mtgo_code: String?
        /// This set’s ID on TCGplayer’s API, also known as the groupId.
        public let tcgplayer_id: Int?
        /// The English name of the set.
        public let name: String
        /// A computer-readable classification for this set.
        public let set_type: String
        /// The date the set was released or the first card was printed in the set (in GMT-8 Pacific time).
        public let released_at: String?
        /// The block code for this set, if any.
        public let block_code: String?
        /// The block or group name code for this set, if any.
        public let block: String?
        /// The set code for the parent set, if any. 'promo' and 'token' sets often have a parent set.
        public let parent_set_code: String?
        /// The number of cards in this set.
        public let card_count: Int
        /// The denominator for the set’s printed collector numbers.
        public let printed_size: Int?
        /// True if this set was only released in a video game.
        public let digital: Bool
        /// True if this set contains only foil cards.
        public let foil_only: Bool
        /// True if this set contains only nonfoil cards.
        public let nonfoil_only: Bool
        /// A link to this set’s permapage on Scryfall’s website.
        public let scryfall_uri: URL
        /// A link to this set object on Scryfall’s API.
        public let uri: URL
        /// A URI to an SVG file for this set’s icon on Scryfall’s CDN. Hotlinking this image isn’t recommended, because it may change slightly over time. You should download it and use it locally for your particular user interface needs.
        public let icon_svg_uri: URL
        /// A Scryfall API URI that you can request to begin paginating over the cards in this set.
        public let search_uri: URL
    }
}
