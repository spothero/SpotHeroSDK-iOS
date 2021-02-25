// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Represents facility information only applicable within the transient context.
public struct TransientFacilityAttributes: Codable {
    private enum CodingKeys: String, CodingKey {
        case redemptionInstructions = "redemption_instructions"
    }
    
    /// Information concerning the redemption process for customers who park at a facility.
    public let redemptionInstructions: TransientRedemptionInstructions
}
