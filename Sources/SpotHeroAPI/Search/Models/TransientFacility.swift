// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Representation of a transient facility.
public struct TransientFacility: Codable {
    /// Represents common facility information applicable in all contexts.
    public let common: CommonFacilityAttributes
    
    /// Represents facility information only applicable within the transient context.
    public let transient: TransientFacilityAttributes
}
