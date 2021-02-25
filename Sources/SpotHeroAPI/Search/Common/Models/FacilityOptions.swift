// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Contains information about misc options available to the user
/// at a given parking facility based on search criteria and user information.
public struct FacilityOptions: Codable {
    private enum CodingKeys: String, CodingKey {
        case isCommuterCardEligible = "commuter_card_eligible"
    }
    
    /// This indicates whether a commuter benefits cards is eligible to be used
    /// at this facility for the work location supplied on the request.
    let isCommuterCardEligible: Bool
}
