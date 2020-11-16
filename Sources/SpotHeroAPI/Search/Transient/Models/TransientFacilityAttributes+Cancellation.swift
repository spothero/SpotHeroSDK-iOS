// Copyright © 2020 SpotHero, Inc. All rights reserved.

public extension TransientFacilityAttributes {
    /// Contains all fields relevant to a facility’s cancellation policy.
    struct Cancellation: Codable {
        private enum CodingKeys: String, CodingKey {
            case allowedByCustomer = "allowed_by_customer"
            case allowedBySpotHeroCustomerService = "allowed_by_spothero_customer_service"
            case minutes
        }
        
        /// Whether or not the reservation can be cancelled by the customer.
        public let allowedByCustomer: Bool
        
        /// Whether or not the reservation can be cancelled by SpotHero’s customer service team. Will always be `true` when `allowedByCustomer` is `true`.
        public let allowedBySpotHeroCustomerService: Bool
        
        /// The number of minutes before a reservation starts at which point cancellation is no longer allowed.
        /// (e.g. When `cancellation.minutes = 60`, cancellations are allowed up until an hour before the reservation start time.)
        public let minutes: Int
    }
}
