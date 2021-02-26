// Copyright © 2021 SpotHero, Inc. All rights reserved.

import Foundation

public extension MonthlyRate {
    struct ParkingPass: Codable {
        private enum CodingKeys: String, CodingKey {
            case displayName = "display_name"
            case type
        }
        
        /// The display name for the parking pass to be shown to users.
        public let displayName: String
        
        // TODO: IOS-2797 - Add link to API documentation showing possible enum values for this property.
        /// Defines the supported parking pass types
        public let type: String
    }
}
