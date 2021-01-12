// Copyright © 2021 SpotHero, Inc. All rights reserved.

import Foundation

public extension Quote {
    /// Represents order line items, including reservation rate and applicable fees.
    struct Order: Codable {
        private enum CodingKeys: String, CodingKey {
            case facilityID = "facility_id"
            case starts
            case ends
            case rateID = "rate_id"
            case items
            case totalPrice = "total_price"
        }
        
        /// Unique identifier of parking spot for which the reservation applies.
        public let facilityID: String
        
        /// ISO 8601 (RFC 3339) datetime localized in the time zone of the parking spot of instant at which reservation begins.
        public let starts: Date
        
        /// ISO 8601 (RFC 3339) datetime localized in the time zone of the parking spot of instant at which reservation ends.
        public let ends: Date
        
        /// Unique identifier of the rate for which the price applies.
        public let rateID: String
        
        /// The list of items that compose the order.
        public let items: [LineItem]
        
        /// The total price of the reservation.
        public let totalPrice: Currency
    }
}
