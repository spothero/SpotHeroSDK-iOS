// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Airport-specific metadata pertaining to a rate for the rental of a parking spot.
public struct AirportRate: Codable {
    private enum CodingKeys: String, CodingKey {
        case amenities
        case comparisons
        case lowestDailyRate = "lowest_daily_rate"
        case redemptionType = "redemption_type"
        case tag
    }
    
    /// Airport parking amenities offered at the facility.
    public let amenities: [Amenity]
    
    /// Lowest daily rate for the facility.
    /// This can be used to display to the user for unavailable spots and/or for advertising purposes.
    public let lowestDailyRate: Currency
    
    /// Defines the type of parking available at a garage.
    public let redemptionType: RedemptionType
    
    /// Metadata used for highlighting spots when showcasing recommended results.
    /// (eg. "Most Popular", "Highest Rated", etc.)
    public let tag: Tag?
    
    /// Attributes that can be displayed to the user to encourage them to book at a given airport facility.
    public let comparisons: Comparisons?
}
