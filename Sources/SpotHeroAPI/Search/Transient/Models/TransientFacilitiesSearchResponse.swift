// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// The response returned when fetching transient facilities.
public struct TransientFacilitiesSearchResponse: Codable {
    /// The list of fetched facility results.
    public let results: [TransientFacilityResult]
}
