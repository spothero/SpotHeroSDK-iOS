// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents facility information only applicable within the monthly context.
public struct MonthlyFacilityAttributes: Codable {
    private enum CodingKeys: String, CodingKey {
        case highestPrice = "highest_price"
        case lowestPrice = "lowest_price"
    }
    
    // WIP: Needs Better Docs
    public let highestPrice: Currency
    
    // WIP: Needs Better Docs
    public let lowestPrice: Currency
}
