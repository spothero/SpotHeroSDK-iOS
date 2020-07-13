// Copyright © 2020 SpotHero, Inc. All rights reserved.

public extension AirportRate {
    /// Attributes that can be displayed to the user to encourage them to book at a given airport facility.
    struct Comparisons: Codable {
        private enum CodingKeys: String, CodingKey {
            case airportPercentLowerPrice = "airport_percent_lower_price"
        }
        
        /// The percentage amount cheaper relative to nearby airport facilities.
        public let airportPercentLowerPrice: Int
    }
}
