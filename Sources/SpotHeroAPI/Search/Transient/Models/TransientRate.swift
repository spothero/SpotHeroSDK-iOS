// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Transient-specific metadata pertaining to a rate for the rental of a parking spot.
public struct TransientRate: Codable {
    /// Transient parking amenities offered at the facility.
    public let amenities: [Amenity]
}
