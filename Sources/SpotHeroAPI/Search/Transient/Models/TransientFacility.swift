// Copyright © 2022 SpotHero, Inc. All rights reserved.

/// Representation of a transient facility.
public struct TransientFacility: CommonFacility {
    /// Represents common facility information applicable in all contexts.
    public let common: CommonFacilityAttributes
    
    /// Represents facility information only applicable within the transient context.
    public let transient: TransientFacilityAttributes
}
