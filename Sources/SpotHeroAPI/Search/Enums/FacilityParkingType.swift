// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

/// Represents a parking type offered at a facility.
public enum FacilityParkingType: String, Codable {
    /// A parking type aimed at travelers wishing to park near airports.
    case airport
    /// A parking type aimed at customers looking for monthly parking.
    case monthly
    /// A parking type aimed at customers looking for daily or hourly parking.
    case transient
}
