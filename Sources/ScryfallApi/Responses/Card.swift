//
//  Card.swift
//  ScryfallApi
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation

public extension ScryfallApi {
    struct Card: Equatable, Codable {
        /// This card’s Arena ID, if any. A large percentage of cards are not available on Arena and do not have this ID.
        public let arena_id: Int?
        /// A unique ID for this card in Scryfall’s database.
        public let id: UUID
        /// A language code for this printing.
        public let lang: String
        /// This card’s Magic Online ID (also known as the Catalog ID), if any. A large percentage of cards are not available on Magic Online and do not have this ID.
        public let mtgo_id: Int?
        /// This card’s foil Magic Online ID (also known as the Catalog ID), if any. A large percentage of cards are not available on Magic Online and do not have this ID.
        public let mtgo_foil_id: Int?
        /// This card’s multiverse IDs on Gatherer, if any, as an array of integers. Note that Scryfall includes many promo cards, tokens, and other esoteric objects that do not have these identifiers.
        public let multiverse_ids: [Int]?
        /// This card’s ID on TCGplayer’s API, also known as the productId.
        public let tcgplayer_id: Int?
        /// This card’s ID on TCGplayer’s API, for its etched version if that version is a separate product.
        public let tcgplayer_etched_id: Int?
        /// This card’s ID on Cardmarket’s API, also known as the idProduct.
        public let cardmarket_id: Int?
        /// A unique ID for this card’s oracle identity. This value is consistent across reprinted card editions, and unique among different cards with the same name (tokens, Unstable variants, etc).
        public let oracle_id: UUID
        /// A link to where you can begin paginating all reprints for this card on Scryfall’s API.
        public let prints_search_uri: URL
        /// A link to this card’s rulings list on Scryfall’s API.
        public let rulings_uri: URL
        /// A link to this card’s permapage on Scryfall’s website.
        public let scryfall_uri: URL
        /// A link to this card object on Scryfall’s API.
        public let uri: URL
        /// If this card is closely related to other cards, this property will contain all related cards.
        public let all_parts: [RelatedCard]?
        /// An array of card faces, if this card is multifaced.
        public let card_faces: [CardFace]?
        /// The card’s converted mana cost. Note that some funny cards have fractional mana costs.
        public let cmc: Double
        /// This card’s color identity. Complete list at https://scryfall.com/docs/api/colors
        public let color_identity: [String]
        /// The colors in this card’s color indicator, if any. A nil value for this field indicates the card does not have one. Complete list at https://scryfall.com/docs/api/colors
        public let color_indicator: [String]?
        /// This card’s colors, if the overall card has colors defined by the rules. Otherwise the colors will be on the `card_faces`. Complete list at https://scryfall.com/docs/api/colors
        public let colors: [String]?
        /// This card’s overall rank/popularity on EDHREC. Not all cards are ranked.
        public let edhrec_rank: Int?
        /// This card’s hand modifier, if it is Vanguard card. This value will contain a delta, such as '-1'.
        public let hand_modifier: String?
        /// Keywords that this card uses, such as 'Flying' and 'Cumulative upkeep'.
        public let keywords: [String]
        /// A code for this card’s layout. Complete list at https://scryfall.com/docs/api/layouts
        public let layout: String
        /// An object describing the legality of this card across formats. Possible legalities are 'legal', 'not_legal', 'restricted', and 'banned'.
        public let legalities: [String: String]
        /// This card’s life modifier, if it is Vanguard card. This value will contain a delta, such as '+2'.
        public let life_modifier: String?
        /// This card's loyalty, if any. Note that some cards have loyalties that are not numeric, such as 'X'.
        public let loyalty: String?
        /// The mana cost for this card. This value will be any empty string "" if the cost is absent. Remember that per the game rules, a missing mana cost and a mana cost of '{0}' are different values. Multi-faced cards will report this value in `card_faces`.
        public let mana_cost: String?
        /// The name of this card. If this card has multiple faces, this field will contain both names separated by '//'.
        public let name: String
        /// The Oracle text for this card, if any.
        public let oracle_text: String?
        /// True if this card is oversized.
        public let oversized: Bool
        /// This card’s power, if any. Note that some cards have powers that are not numeric, such as '*'.
        public let power: String?
        /// Colors of mana that this card could produce. Complese list at https://scryfall.com/docs/api/colors
        public let produced_mana: [String]?
        /// True if this card is on the Reserved List.
        public let reserved: Bool
        /// This card’s toughness, if any. Note that some cards have toughnesses that are not numeric, such as '*'.
        public let toughness: String?
        /// The type line of this card.
        public let type_line: String
        /// The name of the illustrator of this card. Newly spoiled cards may not have this field yet.
        public let artist: String?
        /// Whether this card is found in boosters.
        public let booster: Bool
        /// This card’s border color: 'black', 'white', 'borderless', 'silver', or 'gold'.
        public let border_color: String
        /// The Scryfall ID for the card back design present on this card.
        public let card_back_id: UUID
        /// This card’s collector number. Note that collector numbers can contain non-numeric characters, such as letters or '★'.
        public let collector_number: String
        /// True if you should consider avoiding use of this print downstream.
        public let content_warning: Bool?
        /// True if this card was only released in a video game.
        public let digital: Bool
        /// An array of computer-readable flags that indicate if this card can come in 'foil', 'nonfoil', 'etched', or 'glossy' finishes.
        public let finishes: [String]
        /// The just-for-fun name printed on the card (such as for Godzilla series cards).
        public let flavor_name: String?
        /// The flavor text, if any.
        public let flavor_text: String?
        /// This card's frame effects, if any. Complete list at https://scryfall.com/docs/api/frames
        public let frame_effects: [String]?
        /// This card's frame layout. Complete list at https://scryfall.com/docs/api/frames
        public let frame: String
        /// True if this card’s artwork is larger than normal.
        public let full_art: Bool
        /// A list of games that this card print is available in, 'paper', 'arena', and/or 'mtgo'.
        public let games: [String]
        /// True if this card’s imagery is high resolution.
        public let highres_image: Bool
        /// A unique identifier for the card artwork that remains consistent across reprints. Newly spoiled cards may not have this field yet.
        public let illustration_id: UUID?
        /// A computer-readable indicator for the state of this card’s image, one of 'missing', 'placeholder', 'lowres', or 'highres_scan'.
        public let image_status: String
        /// Available imagery for this card.
        public let image_uris: Images?
        /// Daily price information for this card.
        public let prices: Prices
        /// The localized name printed on this card, if any.
        public let printed_name: String?
        /// The localized text printed on this card, if any.
        public let printed_text: String?
        /// The localized type line printed on this card, if any.
        public let printed_type_line: String?
        /// True if this card is a promotional print.
        public let promo: Bool
        /// An array of strings describing what categories of promo cards this card falls into.
        public let promo_types: [String]?
        /// URIs to this card’s listing on major marketplaces.
        public let purchase_uris: [String: URL]
        /// This card’s rarity. One of 'common', 'uncommon', 'rare', 'special', 'mythic', or 'bonus'.
        public let rarity: String
        /// URIs to this card’s listing on other Magic: The Gathering online resources.
        public let related_uris: [String: URL]
        /// The date this card was first released.
        public let released_at: Date
        /// True if this card is a reprint.
        public let reprint: Bool
        /// A link to this card’s set on Scryfall’s website.
        public let scryfall_set_uri: URL
        /// This card’s full set name.
        public let set_name: String
        /// A link to where you can begin paginating this card’s set on the Scryfall APIs.
        public let set_search_uri: URL
        /// The type of set this printing is in.
        public let set_type: String
        /// A link to this card’s set object on Scryfall’s API.
        public let set_uri: URL
        /// This card’s set code.
        public let set: String
        /// This card's Set object UUID.
        public let set_id: String
        /// True if this card is a Story Spotlight.
        public let story_spotlight: Bool
        /// True if the card is printed without text.
        public let textless: Bool
        /// Whether this card is a variation of another printing.
        public let variation: Bool
        /// The printing ID of the printing this card is a variation of.
        public let variation_of: UUID?
        /// The security stamp on this card, if any. One of 'oval', 'triangle', 'acorn', or 'arena'.
        public let security_stamp: String?
        /// This card’s watermark, if any.
        public let watermark: String?
        /// Preview resources for this card.
        public let preview: Preview?

        public struct CardFace: Equatable, Codable {
            /// The name of the illustrator of this card face. Newly spoiled cards may not have this field yet.
            public let artist: String?
            /// The mana value of this particular face, if the card is reversible.
            public let cmc: Double?
            /// The colors in this face’s color indicator, if any.
            public let color_indicator: [String]?
            /// This face’s colors, if the game defines colors for the individual face of this card.
            public let colors: [String]?
            /// The flavor text printed on this face, if any.
            public let flavor_text: String?
            /// A unique identifier for the card face artwork that remains consistent across reprints. Newly spoiled cards may not have this field yet.
            public let illustration_id: String?
            /// URIs to imagery for this face, if this is a double-sided card. If this card is not double-sided, then the `image_uris` property will be part of the parent type instead.
            public let image_uris: Images?
            /// The layout of this card face, if the card is reversible.
            public let layout: String?
            /// This face’s loyalty, if any.
            public let loyalty: String?
            /// The mana cost for this face. This value will be any empty string "" if the cost is absent. Remember that per the game rules, a missing mana cost and a mana cost of {0} are different values.
            public let mana_cost: String
            /// The name of this particular face.
            public let name: String
            /// The Oracle ID of this particular face, if the card is reversible.
            public let oracle_id: String?
            /// The Oracle text for this face, if any.
            public let oracle_text: String?
            /// This face’s power, if any. Note that some cards have a power that is not numeric, such as "*".
            public let power: String?
            /// The localized name printed on this face, if any.
            public let printed_name: String?
            /// The localized text printed on this face, if any.
            public let printed_text: String?
            /// The localized type line printed on this face, if any.
            public let printed_type_line: String?
            /// This face’s toughness, if any. Note that some cards have a toughness that is not numeric, such as "*".
            public let toughness: String?
            /// The type line of this particular face, if the card is reversible.
            public let type_line: String?
            /// The watermark on this particulary card face, if any.
            public let watermark: String?
        }

        public struct RelatedCard: Equatable, Codable {
            /// A unique ID for this card in Scryfall’s database.
            public let id: UUID
            /// A field explaining what role this card plays in this relationship, one of 'token', 'meld_part', 'meld_result', or 'combo_piece'.
            public let component: String
            /// The name of this particular related card.
            public let name: String
            /// The type line of this card.
            public let type_line: String
            /// A URI where you can retrieve a full object describing this card on Scryfall’s API.
            public let uri: URL
        }

        public struct Images: Equatable, Codable {
            /// 745x1040 PNG. A transparent, rounded full card. This is the best image to use for videos or other high-quality content.
            public let png: URL
            /// 480x680 JPG. A Full card image with the rounded corners and the majority of the border cropped off. Designed for dated contexts where rounded images can’t be used.
            public let border_crop: URL
            /// Variable size JPG. A rectangular crop of the card’s art only. Not guaranteed to be perfect for cards with outlier designs or strange frame arrangements.
            public let art_crop: URL
            /// 672x936 JPG. A large full card image.
            public let large: URL
            /// 488x680 JPG. A medium-sized full card image.
            public let normal: URL
            /// 146x204 JPG. A small full card image. Designed for use as thumbnail or list icon.
            public let small: URL
        }

        public struct Prices: Equatable, Codable {
            /// The price of the normal version of this card in USD.
            public let usd: String?
            /// The price of the foil version of this card in USD.
            public let usd_foil: String?
            /// The price of the etched version of this card in USD.
            public let usd_etched: String?
            /// The price of the normal version of this card in EUR.
            public let eur: String?
            /// The price of the foil version of this card in EUR.
            public let eur_foil: String?
            /// The price of the MTGO digital version of this card in tix.
            private let tix: String?
        }

        public struct Preview: Equatable, Codable {
            /// The name of the source that previewed this card.
            public let source: String?
            /// A link to the preview for this card.
            public let source_uri: URL?
            /// The date this card was previewed.
            public let previewed_at: Date?
        }
    }
}
