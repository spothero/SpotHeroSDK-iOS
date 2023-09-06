// Copyright © 2023 SpotHero, Inc. All rights reserved.

/// Represents an availability search result containing airport facility and rate information.
public struct AirportFacilityResult: Codable {
    /// Availability of a given parking facility.
    public let availability: Availability
    
    /// Distance calculations between the facility and the search origin.
    public let distance: Distance?
    
    /// The facility the was queried.
    public let facility: AirportFacility
    
    /// Listing of available rates at a given parking facility.
    public let rates: [AirportRateContainer]
}
