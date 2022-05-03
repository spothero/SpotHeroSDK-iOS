// Copyright © 2022 SpotHero, Inc. All rights reserved.

/// Representation of an airport facility.
public struct AirportFacility: CommonFacility {
    /// Represents common facility information applicable in all contexts.
    public let common: CommonFacilityAttributes
    
    /// Attributes that apply to the facility for the airport parking type.
    public let airport: AirportFacilityAttributes
}
