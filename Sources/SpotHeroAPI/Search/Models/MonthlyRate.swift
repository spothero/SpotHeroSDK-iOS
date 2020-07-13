// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

/// Monthly-specific metadata pertaining to a rate for the rental of a parking spot.
public struct MonthlyRate: Codable {
    private enum CodingKeys: String, CodingKey {
        case amenities
        case contract
        case inOutPrivileges = "in_out_privileges"
        case postPurchaseInstructions = "post_purchase_instructions"
        case redemption
        case reservationType = "reservation_type"
        case reservationDates = "reservation_dates"
        case startDateRestriction = "start_date_restriction"
        case title
    }
    
    /// Monthly parking amenities offered for this rate at the facility.
    public let amenities: [Amenity]
    
    // WIP: Missing Docs
    public let redemption: Redemption<MonthlyRedemptionInstructions>
    
    /// Human-readable description of the rate.
    public let title: String
    
    /// Additional information to follow up with before parking at the facility.
    public let postPurchaseInstructions: String
    
    /// Restriction on the start date of the monthly reservation.
    public let startDateRestriction: MonthlyStartDateRestriction
    
    /// The category for what kind of monthly reservation this rate applies to.
    public let reservationType: MonthlyReservationType
    
    /// Date options for the first month.
    public let reservationDates: [MonthlyReservationDates]
    
    /// Describes the exit and re-entry privileges.
    public let inOutPrivileges: InOutPrivileges
    
    /// Description of the contract requirements of the reservation.
    public let contract: MonthlyContractDetails
}
