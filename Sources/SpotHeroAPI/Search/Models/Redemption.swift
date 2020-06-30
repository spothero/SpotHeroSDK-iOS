// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Information concerning the redemption process for customers who park at a facility.
public struct Redemption: Codable {
    /// Defines the type of parking available at a garage.
    public let type: RedemptionType
    
    /// Collection of redemption instructions for customers who park at a facility.
    public let instructions: [RedemptionInstruction]
}
