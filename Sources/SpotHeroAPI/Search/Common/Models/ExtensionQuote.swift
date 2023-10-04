// Copyright © 2023 SpotHero, Inc. All rights reserved.

/// Represents an extension rate at a given parking facility.
public struct ExtensionQuote: Codable {
    private enum CodingKeys: String, CodingKey {
        case extendHours = "extend_hours"
        case priceDifference = "price_difference"
        case quote
    }

    /// A quote for parking provided by SpotHero to a prospective renter.
    /// This quote is generated by SpotHero, includes detailed pricing information,
    /// and is guaranteed to be honored for the period of validity specified within
    /// so long as no part of the originally issued quote has been modified.
    public let quote: Quote

    /// Number of hours we allow the user to extend, can be; 1,2 or 3
    public let extendHours: Int

    /// The difference in price after adding extendHours to the reservation
    public let priceDifference: Int
}
