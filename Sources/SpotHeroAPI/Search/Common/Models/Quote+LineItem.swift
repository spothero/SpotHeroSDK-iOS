// Copyright © 2020 SpotHero, Inc. All rights reserved.

public extension Quote {
    /// Represents a line item within an quote.
    struct LineItem: Codable {
        private enum CodingKeys: String, CodingKey {
            case price
            case type
            case shortDescription = "short_description"
            case fullDescription = "full_description"
        }
        
        /// The price of the line item.
        public let price: Currency
        
        /// Origin, purpose, or explanation for the line item.
        public let type: String
        
        /// Abridged human-readable description of the line item.
        public let shortDescription: String
        
        /// Full-length human-readable description of the line item.
        public let fullDescription: String
    }
}
