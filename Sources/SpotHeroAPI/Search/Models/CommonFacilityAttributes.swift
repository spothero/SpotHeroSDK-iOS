// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents common facility information applicable in all contexts.
public struct CommonFacilityAttributes: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case addresses
        case description
        case facilityType = "facility_type"
        case navigationTip = "navigation_tip"
        case clearanceInches = "clearance_inches"
        case hoursOfOperation = "hours_of_operation"
        case images
        case products = "product_types"
        case rating = "ratings"
        case restrictions
        case requirements
        case supportedFeeTypes = "supported_fee_types"
    }
    
    /// Unique ID of the facility.
    public let id: String
    
    /// Title of the facility.
    public let title: String
    
    /// Addresses of the facility.
    public let addresses: [Address]
    
    /// Additional facility details.
    public let description: String
    
    /// The facility type designation.
    public let facilityType: FacilityType
    
    /// Custom instructions for end-user to aid in locating facility.
    public let navigationTip: String
    
    /// Minimum ceiling clearance in inches.
    public let clearanceInches: Int
    
    /// Represents when a facility is open for business.
    public let hoursOfOperation: HoursOfOperation
    
    /// Images of the facility.
    public let images: [Image]
    
    /// Products offered at this facility.
    public let products: [FacilityProduct]
    
    /// Description of the average customer rating of a facility on a scale of 0 to 5.
    public let rating: FacilityRating
    
    /// Restrictions to parking at the facility.
    public let restrictions: [String]
    
    /// End-user requirements for reserving a spot at the given facility.
    public let requirements: FacilityRequirements
    
    // WIP: Missing Docs
    public let supportedFeeTypes: [FacilityFee]
}