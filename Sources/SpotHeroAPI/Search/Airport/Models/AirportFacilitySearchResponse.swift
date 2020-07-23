// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// The response returned when fetching an airport facility.
public struct AirportFacilitySearchResponse: Codable {
    /// Details about the airport destination associated with the search.
    public let airport: Airport
    
    /// The fetched facility result.
    public let result: AirportFacilityResult
}
