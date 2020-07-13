// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// A model representing distance between two coordinates in various formats.
public struct Distance: Codable {
    private enum CodingKeys: String, CodingKey {
        case linearMeters = "linear_meters"
        case walkingMeters = "walking_meters"
    }
    
    /// The linear distance in meters between the facility and search origin.
    public let linearMeters: Double?
    
    // WIP: This might be removed, validate before the end of the spec.
    /// The walking distance in meters between the facility and search origin.
    /// This field is only populated for facilities nearest to the search origin.
    /// For more distant facilities, it will be set to null.
    public let walkingMeters: Double?
}
