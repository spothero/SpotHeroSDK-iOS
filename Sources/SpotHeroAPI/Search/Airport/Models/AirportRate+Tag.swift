// Copyright © 2021 SpotHero, Inc. All rights reserved.

public extension AirportRate {
    /// Metadata used for highlighting spots when showcasing recommended results.
    /// (eg. "Most Popular", "Highest Rated", etc.)
    struct Tag: Codable {
        private enum CodingKeys: String, CodingKey {
            case text
            case sortOrder = "sort_order"
        }
        
        /// The display text for the rate tag.
        public let text: String
        
        /// The sort order for the rate if the user sorts by recommended facilities.
        public let sortOrder: Int
    }
}
