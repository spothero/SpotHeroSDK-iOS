// Copyright © 2020 SpotHero, Inc. All rights reserved.

public extension AirportTransportation {
    /// Details about how often the shuttle runs.
    struct Schedule: Codable {
        private enum CodingKeys: String, CodingKey {
            case fastFrequency = "fast_frequency"
            case slowFrequency = "slow_frequency"
            case duration
        }
        
        /// The shortest wait time in minutes for the shuttle, if available.
        public let fastFrequency: Int?
        
        /// The longest wait time in minutes for the shuttle, if available.
        public let slowFrequency: Int?
        
        /// The time in minutes it takes the shuttle to travel between the facility and airport, if available.
        public let duration: Int?
    }
}
