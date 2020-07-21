// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Designation of different types of facilities.
public enum FacilityType: String, Codable {
    /// An enclosed facility with potentially multiple levels.
    case garage
    /// An unenclosed single level facility.
    case lot
    /// A spot or spots owned by a person, family, or small business not otherwise in the parking business.
    case personal
}
