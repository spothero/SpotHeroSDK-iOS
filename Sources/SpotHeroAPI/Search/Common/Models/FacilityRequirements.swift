// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// End-user requirements for reserving a given facility.
public struct FacilityRequirements: Codable {
    private enum CodingKeys: String, CodingKey {
        case licensePlate = "license_plate"
        case phoneNumber = "phone_number"
        case printout
    }
    
    /// Whether a printout is required at the facility.
    public let printout: Bool
    
    /// Whether a license plate must be provided in order to reserve the facility.
    public let licensePlate: Bool
    
    /// Whether a phone number must be provided in order to reserve the facility.
    public let phoneNumber: Bool
}
