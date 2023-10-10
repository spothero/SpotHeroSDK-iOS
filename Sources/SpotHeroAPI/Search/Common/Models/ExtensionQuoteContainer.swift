// Copyright © 2023 SpotHero, Inc. All rights reserved.

/// Represents a model to decode a following endpoint:
/// "/v2/search/extension_rates/{facility_id}/"
public struct ExtensionQuoteContainer: Codable {
    private enum CodingKeys: String, CodingKey {
        case rateID = "rate_id"
        case extensionQuotes = "extension_quotes"
    }

    /// Unique identifier of the rate for which the price applies.
    public let rateID: String

    /// A list of the ExtensionQuote objects
    public let extensionQuotes: [ExtensionQuote]
}
