// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Information concerning the redemption process for customers who park at a facility.
public struct TransientRedemptionInstructions: Codable {
    private enum CodingKeys: String, CodingKey {
        case driveUp = "drive_up"
    }
    
    /// Instructions for customers to perform upon drive-up to a transient facility.
    public let driveUp: [RedemptionInstruction]
}
