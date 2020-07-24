// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

/// Monthly-specific metadata pertaining to a rate for the rental of a parking spot.
public struct MonthlyRate: Codable {
    private enum CodingKeys: String, CodingKey {
        case amenities
        case contract
        case inOutPrivileges = "in_out_privileges"
        case postPurchaseInstructions = "post_purchase_instructions"
        case redemptionInstructions = "redemption_instructions"
        case redemptionType = "redemption_type"
        case reservationType = "reservation_type"
        case startDateOptions = "start_date_options"
        case title
    }
    
    /// Monthly parking amenities offered for this rate at the facility.
    public let amenities: [Amenity]
    
    /// Information concerning the redemption process for customers who park at a facility.
    public let redemptionInstructions: MonthlyRedemptionInstructions
    
    /// Defines the garage's reservation redemption type.
    public let redemptionType: RedemptionType
    
    /// Human-readable description of the rate.
    public let title: String
    
    /// Additional information to follow up with before parking at the facility.
    public let postPurchaseInstructions: String
    
    /// Information concerning possible start dates for the reservation and any start date restrictions.
    public let startDateOptions: StartDateOptions
    
    /// The category for what kind of monthly reservation this rate applies to.
    public let reservationType: ReservationType
    
    /// Describes the exit and re-entry privileges.
    public let inOutPrivileges: InOutPrivileges
    
    /// Description of the contract requirements of the reservation.
    public let contract: ContractDetails
}

// MARK: - Enums

public extension MonthlyRate {
    /// The category for what kind of monthly reservation this rate applies to.
    enum ReservationType: String, Codable {
        /// Parking is available 24/7.
        case twentyFourSeven = "247"
        
        /// Parking is only available during the day.
        /// The explicit times considered "daytime" are variable depending on the rental rule.
        case daytimeOnly = "daytime_only"
        
        /// Parking is available during the day on weekdays and 24/7 on weekends.
        case daytimeAndTwentyFourSevenWeekend = "daytime_and_247_weekend"
        
        /// Parking is only available overnight.
        /// The explicit times considred "night" are variable depending on the rental rule.
        case nightsOnly = "nights_only"
        
        /// Parking is available overnight on weekdays and 24/7 on weekends.
        case nightsAndTwentyFourSevenWeekend = "nights_and_247_weekend"
        
        /// The reservation is for storage of the vehicle (limited in/out privileges).
        case storage
        
        /// The reservation includes curbside pickup/dropoff.
        case valet
    }
}
