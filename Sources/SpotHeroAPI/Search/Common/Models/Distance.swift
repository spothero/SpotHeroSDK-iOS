// Copyright © 2023 SpotHero, Inc. All rights reserved.

import Foundation

/// A model representing distance between two coordinates in various formats.
public struct Distance: Codable {
    private enum CodingKeys: String, CodingKey {
        case linearMeters = "linear_meters"
        case walkingMeters = "walking_meters"
        case duration = "duration_seconds"
    }
    
    /// The linear distance in meters between the facility and search origin.
    public let linearMeters: Double?

    /// The walking distance in meters between the facility and the search origin.
    public let walkingMeters: Double?

    /// The duration to walk to the facility from the search origin.
    public let duration: TimeInterval?
}
