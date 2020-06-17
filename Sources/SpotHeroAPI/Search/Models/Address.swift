// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents an address.
public struct Address: Codable {
    private enum CodingKeys: String, CodingKey {
        case city
        case country
        case id
        case latitude
        case longitude
        case postalCode = "postal_code"
        case state
        case streetAddress = "street_address"
        case timeZone = "time_zone"
        case types
    }
    
    /// Unique ID of the address.
    public let id: String
    
    /// Street address.
    public let streetAddress: String
    
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
    
    /// The full time zone name from the tz database.
    ///
    /// See [List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
    public let timeZone: String
    
    // WIP: Missing Docs
    public let types: [AddressType]
}
