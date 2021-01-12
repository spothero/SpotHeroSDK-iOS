// Copyright © 2021 SpotHero, Inc. All rights reserved.

public extension MonthlyRate {
    /// Information concerning possible start dates for the reservation and any start date restrictions.
    struct StartDateOptions: Codable {
        /// Restriction on the start date of the monthly reservation.
        public let restriction: Restriction
        
        /// Date options for the first month.
        public let choices: [MonthlyReservationDates]
    }
}

// MARK: - Enums

public extension MonthlyRate.StartDateOptions {
    /// Represents a restriction on the start date of the monthly reservation.
    enum Restriction: String, Codable {
        /// Reservation can only start on the 1st of the month.
        case firstOnly = "1st_only"
        
        /// Reservation may start on the 1st or 15th of the month.
        case firstOrFifteenth = "1st_or_15th"
        
        /// There is no restriction on when the reservation can start.
        case none
    }
}
