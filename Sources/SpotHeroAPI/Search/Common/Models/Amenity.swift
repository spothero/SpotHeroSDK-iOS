// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Represents a transient parking amenity offered at the facility.
public struct Amenity: Codable {
    private enum CodingKeys: String, CodingKey {
        case description
        case displayName = "display_name"
        case type
    }
    
    /// Long-form description of the amenity type.
    public let description: String
    
    /// The display name for the amenity to be shown to users.
    public let displayName: String
    
    /// A value which uniquely distinguishes a type of amenity at a parking spot.
    public let type: AmenityType
}
