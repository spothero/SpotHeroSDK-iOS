// Copyright © 2023 SpotHero, Inc. All rights reserved.

/// The response returned when fetching extension rates for transient facility.
public struct TransientRateExtensionResponse: Codable {
    /// The fetched extension rate result.
    public let results: [ExtensionQuoteContainer]
}
