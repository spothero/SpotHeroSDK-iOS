// Copyright © 2024 SpotHero, Inc. All rights reserved.

/// Transient-specific metadata pertaining to a rate for the rental of a parking spot.
public struct TransientRate: Codable {
    private enum CodingKeys: String, CodingKey {
        case amenities
        case earlyBird = "early_bird"
        case redemptionType = "redemption_type"
        case ruleGroupTitle = "rule_group_title"
        case rateType = "rate_type"
        case cancellationThresholdInMinutes = "cancellation_threshold_minutes"
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

    /// The type of the rate.
    public let rateType: String?
    
    /// The number of minutes before an event starts which the user has to cancel the reservation.
    public let cancellationThresholdInMinutes: Int

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amenities = try container.decode([Amenity].self, forKey: .amenities)
        self.earlyBird = try container.decodeIfPresent(TransientRate.EarlyBird.self, forKey: .earlyBird)
        self.redemptionType = try container.decode(String.self, forKey: .redemptionType)
        self.ruleGroupTitle = try container.decode(String.self, forKey: .ruleGroupTitle)
        self.rateType = try container.decodeIfPresent(String.self, forKey: .rateType)
        self.cancellationThresholdInMinutes = (try? container.decodeIfPresent(Int.self, forKey: .cancellationThresholdInMinutes)) ?? 0
    }
}
