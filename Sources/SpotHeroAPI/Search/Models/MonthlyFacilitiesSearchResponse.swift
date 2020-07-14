// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// The response returned when fetching monthly facilities.
public struct MonthlyFacilitiesSearchResponse: Codable {
    /// The list of fetched facility results.
    public let results: [MonthlyFacilityResult]
}
