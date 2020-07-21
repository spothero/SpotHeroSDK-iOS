// Copyright © 2020 SpotHero, Inc. All rights reserved.

public extension MonthlyRate {
    /// Describes the exit and re-entry privileges.
    struct InOutPrivileges: Codable {
        private enum CodingKeys: String, CodingKey {
            case allowed
            case fee
            case description
        }
        
        /// Whether or not the parker is allowed to leave and come back during the stay.
        public let allowed: Bool
        
        /// The fee charged for each exit and entry. If there is no fee, the value will be 0.
        public let fee: Currency
        
        /// A description about how many times the parker can leave during the stay.
        public let description: String
    }
}
