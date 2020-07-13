// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents common facility information applicable in all contexts.
public struct CommonFacilityAttributes: Codable {
    private enum CodingKeys: String, CodingKey {
        case addresses
        case clearanceInches = "clearance_inches"
        case description
        case facilityType = "facility_type"
        case hoursOfOperation = "hours_of_operation"
        case id
        case images
        case navigationTip = "navigation_tip"
        case parkingTypes = "parking_types"
        case rating
        case restrictions
        case requirements
        case supportedFeeTypes = "supported_fee_types"
        case title
    }
    
    /// Unique ID of the facility.
    public let id: String
    
    /// Title of the facility.
    public let title: String
    
    /// Addresses of the facility.
    public let addresses: [Address]
    
    /// Additional facility details. This field may contain HTML content.
    public let description: String
    
    /// The facility type designation.
    public let facilityType: FacilityType
    
    /// Custom instructions for end-user to aid in locating facility. This field may contain HTML content.
    public let navigationTip: String
    
    /// Minimum ceiling clearance in inches.
    public let clearanceInches: Int?
    
    /// Represents when a facility is open for business.
    public let hoursOfOperation: HoursOfOperation
    
    /// Images of the facility.
    public let images: [Image]
    
    /// Parking types offered at this facility.
    public let parkingTypes: [FacilityParkingType]
    
    /// Description of the average customer rating of a facility on a scale of 0 to 5.
    public let rating: FacilityRating
    
    /// Restrictions to parking at the facility. This field may contain HTML content.
    public let restrictions: [String]
    
    /// End-user requirements for reserving a spot at the given facility.
    public let requirements: FacilityRequirements
    
    /// An array defining the supported fee types at the facility.
    public let supportedFeeTypes: [FacilityFee]
}
