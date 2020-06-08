// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents an address.
public struct Address: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case streetAddress1 = "street_address_1"
        case streetAddress2 = "street_address_2"
        case city
        case state
        case postalCode = "zipcode"
        case country
        case latitude
        case longitude
        case timeZone = "timezone"
        case types
    }
    
    /// Unique ID of the address.
    public let id: String
    
    /// First line of street address.
    public let streetAddress1: String
    
    /// Second line of street address.
    public let streetAddress2: String
    
    /// Name of city.
    public let city: String
    
    /// Two-letter state abbreviation.
    public let state: String
    
    /// Postal code for the address (ZIP code for United States).
    public let postalCode: String
    
    /// Country code in which the address resides in ISO 3166-2 format.
    public let country: String
    
    /// Latitude in decimal degrees in [-90, 90].
    public let latitude: Double
    
    /// Longitude in decimal degrees in [-180, 180].
    public let longitude: Double
    
    // WIP: Missing Docs
    public let timeZone: String
    
    // WIP: Missing Docs
    public let types: [AddressType]
}
