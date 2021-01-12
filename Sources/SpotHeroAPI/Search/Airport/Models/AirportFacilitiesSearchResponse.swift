// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// The response returned when fetching airport facilities.
public struct AirportFacilitiesSearchResponse: Codable {
    /// Details about the airport destination associated with the search.
    public let airport: Airport
    
    /// The list of fetched facility results.
    public let results: [AirportFacilityResult]
}
