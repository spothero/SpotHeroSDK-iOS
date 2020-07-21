// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents a line item within an quote.
public struct QuoteLineItem: Codable {
    private enum CodingKeys: String, CodingKey {
        case price
        case type
        case shortDescription
        case fullDescription
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
