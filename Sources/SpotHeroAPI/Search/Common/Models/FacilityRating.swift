// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents the rating of a facility.
public struct FacilityRating: Codable {
    /// Average rating from 0 to 5.
    /// `nil` implies that the rating has not yet been calculated.
    public let average: Double?
    
    /// Number of ratings.
    public let count: Int
}
