// Copyright © 2022 SpotHero, Inc. All rights reserved.

/// Representation of a facility.
public protocol CommonFacility: Codable {
    /// Represents common facility information applicable in all contexts.
    var common: CommonFacilityAttributes { get }
}
