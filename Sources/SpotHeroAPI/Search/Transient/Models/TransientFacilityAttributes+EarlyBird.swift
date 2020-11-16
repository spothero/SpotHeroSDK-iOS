// Copyright © 2020 SpotHero, Inc. All rights reserved.

public extension TransientFacilityAttributes {
    /// Contains all fields relevant to a facility’s cancellation policy.
    struct EarlyBird: Codable {
        private enum CodingKeys: String, CodingKey {
            case description
            case enterPriod = "enter_period"
        }
    }
}
