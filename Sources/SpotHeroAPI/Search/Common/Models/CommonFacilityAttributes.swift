// Copyright © 2024 SpotHero, Inc. All rights reserved.

/// Represents common facility information applicable in all contexts.
public struct CommonFacilityAttributes: Codable {
    private enum CodingKeys: String, CodingKey {
        case addresses
        case cancellation
        case clearanceInches = "clearance_inches"
        case description
        case facilityType = "facility_type"
        case hoursOfOperation = "hours_of_operation"
        case id
        case images
        case navigationTip = "navigation_tip"
        case parkingTypes = "parking_types"
        case rating
        case reservationExtensionEnabled = "reservation_extension_enabled"
        case restrictions
        case requirements
        case slug
        case supportedFeeTypes = "supported_fee_types"
        case title
        case visualFlags = "visual_flags"
    }
    
    /// Unique ID of the facility.
    public let id: String
    
    /// Title of the facility.
    public let title: String
    
    /// The facility URL slug.
    public let slug: String
    
    /// Addresses of the facility.
    public let addresses: [Address]
    
    /// Additional facility details. This field may contain HTML content.
    public let description: String
    
    /// The facility type designation.
    /// See Facility Types in the README for a list of supported types.
    /// https://github.com/spothero/SpotHeroSDK-iOS/#facility-types
    public let facilityType: String
    
    /// Custom instructions for end-user to aid in locating facility. This field may contain HTML content.
    public let navigationTip: String
    
    /// Minimum ceiling clearance in inches.
    public let clearanceInches: Int?
    
    /// Represents when a facility is open for business.
    public let hoursOfOperation: HoursOfOperation
    
    /// Images of the facility.
    public let images: [ImageInfo]
    
    /// Parking types offered at this facility.
    /// See Facility Parking Types in the README for a list of supported types.
    /// https://github.com/spothero/SpotHeroSDK-iOS/#facility-parking-types
    public let parkingTypes: [String]
    
    /// Description of the average customer rating of a facility on a scale of 0 to 5.
    public let rating: FacilityRating
    
    /// Whether a reservation at this facility is able to be extended after initial purchase.
    public let reservationExtensionEnabled: Bool
    
    /// Restrictions to parking at the facility. This field may contain HTML content.
    public let restrictions: [String]
    
    /// End-user requirements for reserving a spot at the given facility.
    public let requirements: FacilityRequirements
    
    /// An array defining the fee types at the facility.
    /// See Facility Fees in the README for a list of supported types.
    /// https://github.com/spothero/SpotHeroSDK-iOS/#facility-fees
    public let supportedFeeTypes: [String]
    
    /// Contains all fields relevant to a facility’s cancellation policy.
    public let cancellation: Cancellation
    
    /// An array of visual flags
    public let visualFlags: [VisualFlag]?
}
