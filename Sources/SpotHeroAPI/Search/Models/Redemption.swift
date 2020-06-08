// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Information concerning the redemption process for customers who park at a facility.
public struct Redemption: Codable {
    // WIP: Missing Docs
    public let type: RedemptionType
    
    /// Collection of redemption instructions for customers who park at a facility.
    public let instructions: [RedemptionInstruction]
}
