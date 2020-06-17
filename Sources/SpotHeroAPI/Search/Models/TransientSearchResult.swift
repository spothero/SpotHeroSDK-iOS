// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents an availability search result containing transient facility and rate information.
public struct TransientSearchResult: Codable {
    /// Distance calculations between the facility and the search origin.
    public let distance: Distance?
    
    /// Representation of a Facility.
    public let facility: TransientFacility
    
    /// Listing of available rates at a given parking facility.
    public let rates: [TransientRateContainer]
}
