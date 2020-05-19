// Copyright © 2020 SpotHero, Inc. All rights reserved.

import CoreLocation
import Foundation

/// Represents a searchable airport.
public struct Airport: Codable {
    // MARK: Properties
    
    /// The city the airport is located in.
    public let city: String
    
    /// The display name of the airport, not necessarily unique. (Did you know there are two Logan International Airports?)
    public let name: String
    
    /// The internationally-recognized unique airport identifier.
    public let iataCode: String
    
    /// This airport's entries in Google Places.
    public let googlePlaceIDs: [String]?
    
    /// Location coordination information.
    public let latitude: Double
    public let longitude: Double
    
    /// The string identifier of the airport's timezone.
    public let timeZoneIdentifier: String
    
    /// Representation of the airport's location for compatability with `CoreLocation` operations.
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude,
                                      longitude: self.longitude)
    }
    
    // MARK: Enums
    
    public enum CodingKeys: String, CodingKey {
        case city
        case name
        case iataCode // = "iata_code"
        case googlePlaceIDs // = "google_place_ids"
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

// MARK: - Extensions

extension Airport: Equatable {
    public static func == (lhs: Airport, rhs: Airport) -> Bool {
        return lhs.city == rhs.city
            && lhs.name == rhs.name
            && lhs.iataCode == rhs.iataCode
            && lhs.googlePlaceIDs == rhs.googlePlaceIDs
            && lhs.latitude == rhs.latitude
            && lhs.longitude == rhs.longitude
            && lhs.timeZoneIdentifier == rhs.timeZoneIdentifier
    }
}
