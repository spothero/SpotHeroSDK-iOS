// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// A model representing distance between two coordinates in various formats.
public struct Distance: Codable {
    private enum CodingKeys: String, CodingKey {
        case linearMeters = "linear_meters"
    }
    
    /// The linear distance in meters between the facility and search origin.
    public let linearMeters: Double?
}
