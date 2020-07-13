// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Information concerning the redemption process for customers who park at a facility.
public struct MonthlyRedemptionInstructions: Codable {
    private enum CodingKeys: String, CodingKey {
        case shortTerm = "short_term"
        case longTerm = "long_term"
    }
    
    // Collection of short-term redemption instructions for parking at a monthly facility.
    public let shortTerm: [RedemptionInstruction]
    
    // Collection of long-term redemption instructions for parking at a monthly facility.
    public let longTerm: [RedemptionInstruction]
}
