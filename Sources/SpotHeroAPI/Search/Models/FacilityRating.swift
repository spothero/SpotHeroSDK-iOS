// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents the rating of a facility.
public struct FacilityRating: Codable {
    /// Average rating from 0 to 5.
    public let rating: Double
    
    /// Number of ratings.
    public let count: Int
}
