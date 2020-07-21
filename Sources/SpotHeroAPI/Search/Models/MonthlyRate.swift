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
        case startDateOptions = "start_date_options"
        case title
    }
    
    /// Monthly parking amenities offered for this rate at the facility.
    public let amenities: [Amenity]
    
    /// Information concerning the redemption process for customers who park at a monthly facility.
    public let redemption: Redemption<MonthlyRedemptionInstructions>
    
    /// Human-readable description of the rate.
    public let title: String
    
    /// Additional information to follow up with before parking at the facility.
    public let postPurchaseInstructions: String
    
    /// Information concerning possible start dates for the reservation and any start date restrictions.
    public let startDateOptions: StartDateOptions
    
    /// The category for what kind of monthly reservation this rate applies to.
    public let reservationType: MonthlyReservationType
    
    /// Describes the exit and re-entry privileges.
    public let inOutPrivileges: InOutPrivileges
    
    /// Description of the contract requirements of the reservation.
    public let contract: MonthlyContractDetails
}

/// Information concerning possible start dates for the reservation and any start date restrictions.
public struct StartDateOptions: Codable {
    /// Restriction on the start date of the monthly reservation.
    public let restriction: MonthlyStartDateRestriction
    
    /// Date options for the first month.
    public let choices: [MonthlyReservationDates]
}
