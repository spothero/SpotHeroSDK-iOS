// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Details about the airport destination associated with the search.
public struct Airport: Codable {
    private enum CodingKeys: String, CodingKey {
        case code
        case fullName = "full_name"
        case shortName = "short_name"
        case latitude
        case longitude
    }
    
    /// The IATA code of the airport.
    public let code: String
    
    /// The full name of the airport.
    public let fullName: String
    
    /// The abbreviated name of the airport.
    public let shortName: String
    
    /// Latitude in decimal degrees in [-90, 90].
    public let latitude: Double
    
    /// Longitude in decimal degrees in [-180, 180].
    public let longitude: Double
}
