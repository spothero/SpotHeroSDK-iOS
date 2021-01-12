// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Defines the type of parking available at a garage.
public enum RedemptionType: String, Codable {
    /// A valet parks the customer's vehicle, usually in a special place or private garage.
    case premiumValet = "premium_valet"
    /// A customer parks their own vehicle.
    case `self`
    /// A valet helps a customer park their vehicle.
    case selfValetAssist = "self_valet_assist"
    /// A valet parks the customer's vehicle.
    case valet
}
