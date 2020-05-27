// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

/// Represents a searchable airport.
public struct PartnerAirport: Codable, Equatable {
    // MARK: Properties
    
    /// The city the airport is located in.
    public let city: String
    
    /// The display name of the airport, not necessarily unique. (Did you know there are two Logan International Airports?)
    public let name: String
    
    /// The internationally-recognized unique airport identifier.
    public let iataCode: String
    
    /// This airport's entries in Google Places.
    public let googlePlaceIDs: [String]?
    
    /// The latitude coordinate of the airport.
    public let latitude: Double
    
    /// The longitude coordinate of the airport.
    public let longitude: Double
    
    /// The string identifier of the airport's timezone.
    public let timeZoneIdentifier: String
    
    // MARK: Enums
    
    public enum CodingKeys: String, CodingKey {
        case city
        case name
        case iataCode = "iata_code"
        case googlePlaceIDs = "google_place_ids"
        case latitude
        case longitude
        case timeZoneIdentifier = "timezone"
    }
    
    // MARK: Methods
    
    public init(city: String,
                name: String,
                iataCode: String,
                googlePlaceIDs: [String]?,
                latitude: Double,
                longitude: Double,
                timeZoneIdentifier: String) {
        self.city = city
        self.name = name
        self.iataCode = iataCode
        self.googlePlaceIDs = googlePlaceIDs
        self.latitude = latitude
        self.longitude = longitude
        self.timeZoneIdentifier = timeZoneIdentifier
    }
}
