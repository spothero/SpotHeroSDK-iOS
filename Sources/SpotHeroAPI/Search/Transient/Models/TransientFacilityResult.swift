// Copyright © 2024 SpotHero, Inc. All rights reserved.

/// Represents an availability search result containing transient facility and rate information.
public struct TransientFacilityResult: Codable {
    /// Availability of a given parking facility.
    public let availability: Availability
    
    /// Distance calculations between the facility and the search origin.
    public let distance: Distance?
    
    /// The facility the was queried.
    public let facility: TransientFacility
    
    /// Contains information about misc options available to the user
    /// at a given parking facility based on search criteria and user information.
    public let options: FacilityOptions
    
    /// Listing of available rates at a given parking facility.
    public let rates: [TransientRateContainer]

    /// The information about oversize vehicle fees if any.
    public let vehicle: OversizeVehicleFeeInformation?
}
