// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Represents facility information only applicable within the monthly context.
public struct MonthlyFacilityAttributes: Codable {
    private enum CodingKeys: String, CodingKey {
        case highestPrice = "highest_price"
        case lowestPrice = "lowest_price"
    }
    
    /// The highest available monthly rental price at the facility.
    /// If there are no available rates, the value will be 0.
    public let highestPrice: Currency
    
    /// The lowest available monthly rental price at the facility.
    /// If there are no available rates, the value will be 0.
    public let lowestPrice: Currency
}
