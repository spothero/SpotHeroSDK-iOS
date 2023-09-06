// Copyright © 2023 SpotHero, Inc. All rights reserved.

/// Transient-specific metadata pertaining to a rate for the rental of a parking spot.
public struct TransientRate: Codable {
    private enum CodingKeys: String, CodingKey {
        case amenities
        case earlyBird = "early_bird"
        case redemptionType = "redemption_type"
        case ruleGroupTitle = "rule_group_title"
    }
    
    /// Transient parking amenities offered at the facility.
    public let amenities: [Amenity]
    
    /// Stores rate data specific to the early bird rate, if applicable.
    /// If the returned rate does not represent an early bird rate, this object will be `nil`.
    public let earlyBird: EarlyBird?
    
    /// Defines the garage's reservation redemption type.
    /// See Redemption Types in the README for a list of supported types.
    /// https://github.com/spothero/SpotHeroSDK-iOS/#redemption-types
    public let redemptionType: String
    
    /// The title of the rule group.
    public let ruleGroupTitle: String
}
