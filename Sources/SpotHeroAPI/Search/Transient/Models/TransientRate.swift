// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Transient-specific metadata pertaining to a rate for the rental of a parking spot.
public struct TransientRate: Codable {
    private enum CodingKeys: String, CodingKey {
        case amenities
        case redemptionType = "redemption_type"
    }
    
    /// Transient parking amenities offered at the facility.
    public let amenities: [Amenity]
    
    /// Defines the type of parking available at a garage.
    public let redemptionType: RedemptionType
}
