// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Represents an availability search result containing transient facility and rate information.
public struct TransientFacilityResult: Codable {
    /// Whether the spot is available,
    ///  ADD BETTER DESCRIPTION
    public let availability: Availability
    /// Distance calculations between the facility and the search origin.
    public let distance: Distance?
    
    /// Representation of a Facility.
    public let facility: TransientFacility
    
    /// Contains information about misc options available to the user
    /// at a given parking facility based on search criteria and user information.
    public let options: FacilityOptions
    
    /// Listing of available rates at a given parking facility.
    public let rates: [TransientRateContainer]
}
