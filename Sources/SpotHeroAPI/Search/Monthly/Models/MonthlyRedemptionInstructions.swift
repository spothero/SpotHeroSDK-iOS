// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Information concerning the redemption process for customers who park at a monthly facility.
public struct MonthlyRedemptionInstructions: Codable {
    private enum CodingKeys: String, CodingKey {
        case shortTerm = "short_term"
        case longTerm = "long_term"
    }
    
    /// Collection of redemption instructions for parking at a monthly facility.
    /// The short term set typically involves instructions for drive up and entrance.
    public let shortTerm: [RedemptionInstruction]
    
    /// Collection of redemption instructions for parking at a monthly facility.
    /// The long term set typically involves instructions for parking over time and ending the reservation.
    public let longTerm: [RedemptionInstruction]
}
