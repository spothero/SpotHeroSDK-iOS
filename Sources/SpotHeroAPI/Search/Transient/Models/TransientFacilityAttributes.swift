// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents facility information only applicable within the transient context.
public struct TransientFacilityAttributes: Codable {
    private enum CodingKeys: String, CodingKey {
        case cancellation
        case redemptionInstructions = "redemption_instructions"
    }
    
    /// Contains all fields relevant to a facility’s cancellation policy.
    public let cancellation: Cancellation
    
    /// Information concerning the redemption process for customers who park at a facility.
    public let redemptionInstructions: TransientRedemptionInstructions
}
