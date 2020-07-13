// Copyright © 2020 SpotHero, Inc. All rights reserved.

// WIP: Missing Docs
public struct AirportFacilityResult: Codable {
    /// Distance calculations between the facility and the search origin.
    public let distance: Distance?
    
    /// Representation of a Facility.
    public let facility: AirportFacility
    
    /// Listing of available rates at a given parking facility.
    public let rates: [AirportRateContainer]
}
