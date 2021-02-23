// Copyright © 2021 SpotHero, Inc. All rights reserved.

import Foundation

/// Monthly-specific metadata pertaining to a rate for the rental of a parking spot.
public struct MonthlyRate: Codable {
    private enum CodingKeys: String, CodingKey {
        case activationFee = "activation_fee"
        case amenities
        case contract
        case description
        case inOutPrivileges = "in_out_privileges"
        case isOversized = "is_oversized"
        case isRecurrable = "recurrable"
        case parkingDelayDays = "parking_delay_days"
        case parkingPass = "parking_pass"
        case postPurchaseInstructions = "post_purchase_instructions"
        case redemptionInstructions = "redemption_instructions"
        case redemptionType = "redemption_type"
        case reservationType = "reservation_type"
        case startDateOptions = "start_date_options"
        case termsAndConditionsURL = "terms_and_conditions_url"
        case title
    }
    
    /// Monthly parking amenities offered for this rate at the facility.
    public let amenities: [Amenity]
    
    /// Information concerning the redemption process for customers who park at a facility.
    public let redemptionInstructions: MonthlyRedemptionInstructions
    
    /// Defines the garage's reservation redemption type.
    public let redemptionType: RedemptionType
    
    /// The type of parking pass supported at a parking spot.
    public let parkingPass: ParkingPass
    
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
    
    /// Number of business days after purchase the renter may begin parking.
    /// This often corresponds to the time it takes to create a new physical card/device for the renter to freely access the garage.
    public let parkingDelayDays: Int
    
    /// Whether the rate can be recurred each month. A value of false indicates the rate is one-time charge for the specified time period.
    public let isRecurrable: Bool
    
    /// The url containing the terms and conditions specific to the rate and facility.
    /// This will be an empty string when there is no associated terms and conditions.
    public let termsAndConditionsURL: String
    
    /// The fee charged for activating the monthly reservation.
    /// This fee is often collected to cover the cost of creating a new physical card/device for the renter to freely access the garage.
    /// If there is no fee, the value will be 0.
    public let activationFee: Currency
    
    /// HTML markup containing additional information that the user should know about this rate.
    public let description: String
    
    /// Whether the rate pertains to the oversize vehicles.
    public let isOversized: Bool
}

public extension MonthlyRate {
    struct ParkingPass: Codable {
        private enum CodingKeys: String, CodingKey {
            case displayName = "display_name"
            case type
        }
        
        /// The display name for the parking pass to be shown to users.
        public let displayName: String
        
        /// Defines the supported parking pass types
        public let type: String
    }
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
