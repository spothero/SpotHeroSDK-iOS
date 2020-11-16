// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents facility information only applicable within the transient context.
public struct TransientFacilityAttributes: Codable {
    private enum CodingKeys: String, CodingKey {
        case cancellation
        case isCommutedCardEligible = "is_commuter_card_eligible"
        case redemptionInstructions = "redemption_instructions"
    }
    
    /// Contains all fields relevant to a facility’s cancellation policy.
    public let cancellation: Cancellation
    
    /// Indicates whether a commuter benefits cards is eligible to be used at this facility for the work location supplied on the request.
    public let isCommutedCardEligible: Bool
    
    /// Information concerning the redemption process for customers who park at a facility.
    public let redemptionInstructions: TransientRedemptionInstructions
}
