// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Representation of a monthly facility.
public struct MonthlyFacility: CommonFacility {
    /// Represents common facility information applicable in all contexts.
    public let common: CommonFacilityAttributes
    
    /// Represents facility information only applicable within the monthly context.
    public let monthly: MonthlyFacilityAttributes
}
