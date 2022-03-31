// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Represents an availability search result containing monthly facility and rate information.
public struct MonthlyFacilityResult: Codable {
    /// Availability of a given parking facility.
    public let availability: Availability
    
    /// Distance calculations between the facility and the search origin.
    public let distance: Distance?
    
    /// Representation of a Facility.
    public let facility: MonthlyFacility
    
    /// Contains information about misc options available to the user
    /// at a given parking facility based on search criteria and user information.
    public let options: FacilityOptions
    
    /// Listing of available rates at a given parking facility.
    public let rates: [MonthlyRateContainer]
}
