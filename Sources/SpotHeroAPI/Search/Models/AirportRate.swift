// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Airport-specific metadata pertaining to a rate for the rental of a parking spot.
public struct AirportRate: Codable {
    private enum CodingKeys: String, CodingKey {
        case lowestDailyRate = "lowest_daily_rate"
        case tag
        case comparisons
    }
    
    // WIP: Missing Docs
    public let lowestDailyRate: Currency
    
    /// Optional metadata to highlight specific spots.
    public let tag: Tag?
    
    /// Attributes that can be displayed to the user to encourage them to book at a given airport facility.
    public let comparisons: Comparisons?
}
