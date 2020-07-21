// Copyright © 2020 SpotHero, Inc. All rights reserved.

public extension MonthlyRate {
    /// Information concerning possible start dates for the reservation and any start date restrictions.
    struct StartDateOptions: Codable {
        /// Restriction on the start date of the monthly reservation.
        public let restriction: MonthlyStartDateRestriction
        
        /// Date options for the first month.
        public let choices: [MonthlyReservationDates]
    }
}
