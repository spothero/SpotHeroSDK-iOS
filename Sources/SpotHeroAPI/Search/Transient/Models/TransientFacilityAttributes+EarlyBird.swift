// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

public extension TransientFacilityAttributes {
    /// Contains all fields relevant to a facility’s cancellation policy.
    struct EarlyBird: Codable {
        private enum CodingKeys: String, CodingKey {
            case description
            case enterPeriod = "enter_period"
        }
        
        /// The human readable description of the early bird rate.
        public let description: String
        
        /// Store the enter start/end times for the early bird rate.
        public let enterPeriod: EnterPeriod
    }
}

public extension TransientFacilityAttributes.EarlyBird {
    /// Store the enter start/end times for the early bird rate.
    struct EnterPeriod: Codable {
        /// The enter start time for the early bird rate in the format XX:XX AM/PM with leading 0’s removed.
        public let starts: String
        
        /// The enter end time for the early bird rate in the format XX:XX AM/PM with leading 0’s removed.
        public let ends: String
    }
}
