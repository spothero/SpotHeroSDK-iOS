// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents contact information.
public struct ContactInformation: Codable {
    private enum CodingKeys: String, CodingKey {
        case email
        case phoneNumber = "phone_number"
    }
    
    /// Email address of the contact.
    public let email: String
    
    /// Phone number of the contact.
    public let phoneNumber: String
}
