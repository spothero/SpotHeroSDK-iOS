// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents a currency value/code pair.
public struct Currency: Codable {
    private enum CodingKeys: String, CodingKey {
        case value
        case currencyCode = "currency_code"
    }
    
    /// Quantity of currency expressed in irreducible monetary units (e.g., cents for USD).
    public let value: Int
    
    /// The currency in which all monetary values are expressed, given as an ISO 4217 currency code.
    public let currencyCode: CurrencyCode
}
