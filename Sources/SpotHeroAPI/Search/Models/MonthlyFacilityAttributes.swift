// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents facility information only applicable within the monthly context.
public struct MonthlyFacilityAttributes: Codable {
    private enum CodingKeys: String, CodingKey {
        case amenitiesSuperset = "amenities_superset"
        case redemption
        case highestPrice = "highest_price"
        case lowestPrice = "lowest_price"
        case contact
    }
    
    /// All monthly parking amenities offered at the facility.
    /// This is the superset all possible amenities offered for monthly parking.
    public let amenitiesSuperset: [Amenity]
    
    // WIP: Missing Docs
    public let redemption: Redemption
    
    // WIP: Needs Better Docs
    public let highestPrice: Currency
    
    // WIP: Needs Better Docs
    public let lowestPrice: Currency
    
    /// Monthly contact information for the facility.
    public let contact: ContactInformation
}
