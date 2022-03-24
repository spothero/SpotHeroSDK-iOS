// Copyright © 2022 SpotHero, Inc. All rights reserved.

/// Transient-specific metadata pertaining to a rate for the rental of a parking spot.
public struct TransientRate: Codable {
    private enum CodingKeys: String, CodingKey {
        case amenities
        case earlyBird = "early_bird"
        case redemptionType = "redemption_type"
    }
    
    /// Transient parking amenities offered at the facility.
    public let amenities: [Amenity]
    
    /// Stores rate data specific to the early bird rate, if applicable.
    /// If the returned rate does not represent an early bird rate, this object will be `nil`.
    public let earlyBird: EarlyBird?
    
    /// Defines the garage's reservation redemption type.
    /// See `RedemptionType.swift` for a list of supported types.
    public let redemptionType: String
}
