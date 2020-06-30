// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// The type of product a facility is offering.
public enum FacilityProductType: String, Codable {
    /// A product aimed at travelers wishing to park near airports.
    case airport
    /// A product aimed at customers looking for monthly parking.
    case monthly
    /// A product aimed at customers looking for daily or hourly parking.
    case transient
}
