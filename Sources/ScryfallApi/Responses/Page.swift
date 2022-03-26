/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

public extension ScryfallApi {
    struct Page<T: Equatable & Codable>: Equatable, Codable {
        /// True if the results are paginated and there is a page beyond the current page.
        public let has_more: Bool?
        /// If there is a page beyond the current page, this field will contain the full URI to that page.
        public let next_page: String?
        /// An array of the requested objects, in a specific order.
        public let data: [T]
        /// The total number of cards found across all pages.
        public let total_cards: Int?
        /// Identifiers for requested objects that could not be found.
        public let not_found: [String]?
        /// Non-fatal issues that the API discovered with the input when generating this page (human-readable).
        public let warnings: [String]?

        private struct Fallback: Decodable {}

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            var nestedCotainer = try container.nestedUnkeyedContainer(forKey: .data)

            var data: [T] = []
            while !nestedCotainer.isAtEnd {
                if let result = try? nestedCotainer.decode(T.self) {
                    data.append(result)
                } else {
                    // The optional cast does not increment the nested container's current index.
                    // Force the nested container to increment in the case of a failure to prevent a loop.
                    _ = try? nestedCotainer.decode(Fallback.self)
                }
            }
            self.data = data

            has_more = try? container.decode(Bool.self, forKey: .has_more)
            next_page = try? container.decode(String.self, forKey: .next_page)
            total_cards = try? container.decode(Int.self, forKey: .total_cards)
            not_found = try? container.decode([String].self, forKey: .not_found)
            warnings = try? container.decode([String].self, forKey: .warnings)
        }
    }
}
