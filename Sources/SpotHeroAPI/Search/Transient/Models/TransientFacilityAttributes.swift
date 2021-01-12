// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Represents facility information only applicable within the transient context.
public struct TransientFacilityAttributes: Codable {
    private enum CodingKeys: String, CodingKey {
        case isCommutedCardEligible = "is_commuter_card_eligible"
        case redemptionInstructions = "redemption_instructions"
    }
    
    /// Indicates whether a commuter benefits cards is eligible to be used at this facility for the work location supplied on the request.
    public let isCommutedCardEligible: Bool
    
    /// Information concerning the redemption process for customers who park at a facility.
    public let redemptionInstructions: TransientRedemptionInstructions
}
