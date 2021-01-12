// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Information concerning the redemption process for customers who park at a facility.
public struct AirportRedemptionInstructions: Codable {
    /// Instructions for customers to perform upon arrival to an airport facility.
    public let arrival: [RedemptionInstruction]
    
    /// Instructions for customers to perform upon departure from an airport facility.
    public let departure: [RedemptionInstruction]
}
