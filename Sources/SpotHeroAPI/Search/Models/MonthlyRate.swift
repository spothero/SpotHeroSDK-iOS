// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

/// Monthly-specific metadata pertaining to a rate for the rental of a parking spot.
public struct MonthlyRate: Codable {
    private enum CodingKeys: String, CodingKey {
        case amenities
        case title
        case postPurchaseInstructions = "post_purchase_instructions"
        case startDateRestrictions = "start_date_restrictions"
        case reservationType = "reservation_type"
        case reservationDates = "reservation_dates"
        case inOutPrivileges = "in_out"
        case contract
    }
    
    /// Monthly parking amenities offered for this rate at the facility.
    public let amenities: [Amenity]
    
    /// Human-readable description of the rate.
    public let title: String
    
    /// Additional information to follow up with before parking at the facility.
    public let postPurchaseInstructions: String
    
    /// This shows what day of the month that billing will start.
    public let startDateRestrictions: MonthlyStartDateRestriction
    
    /// The category for what kind of monthly reservation this rate applies to.
    public let reservationType: MonthlyReservationType
    
    /// Date options for the first month.
    public let reservationDates: [MonthlyReservationDates]
    
    /// Describes the exit and re-entry privileges.
    public let inOutPrivileges: InOutPrivileges
    
    /// Description of the contract requirements of the reservation.
    public let contract: MonthlyContractDetails
}
