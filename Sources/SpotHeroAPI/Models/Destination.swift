// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

/// A class representing a Destination, such as Wrigley Field or the Verizon Center,
/// which may host many individual events (concerts, games, etc).
public final class Destination: NSObject, Decodable {
    // MARK: Properties
    
    /// The unique identifier of this destination
    public let identifier: Int
    
    /// The user-facing title/name of this destination
    public let title: String
    
    /// The street address of this destination
    public let streetAddress: String
    
    /// The city where this destination is located
    public let city: String
    
    /// The state where this destination is located
    public let state: String
    
    /// The zip code where this destination is located
    public let zipCode: String
    
    /// The name of the time zone where this destination is located
    public let timeZone: TimeZone
    
    /// The latitude where this destination is located
    public let latitude: Double
    
    /// The longitude where this destination is located
    public let longitude: Double
    
    /// Any events associated with this destination
    public let events: [Event]?
    
    /// Any Google Places identifiers associated with this destination
    public let placeIDs: [String]?
    
    /// Aiport Information associated with this destination or nill if not an airport
    public let airport: Airport?
    
    /// Any category associated with this destination
    public let categories: [DestinationCategory]?
    
    // MARK: Enums
    
    private enum CodingKeys: String, CodingKey {
        case airport
        case categories
        case city
        case events
        case identifier = "id"
        case latitude
        case longitude
        case placeIDs = "places_place_ids"
        case state
        case streetAddress = "street_address"
        case timeZone = "timezone"
        case title
        case zipCode = "zipcode"
    }
    
    public enum DestinationCategory: Int, Codable {
        case neighborhood = 1
        case theaterOrVenue = 2
        case landmark = 3
        case airport = 4
        case hotel = 5
        case restaurant = 6
        case pointOfInterest = 7
        case universityOrSchool = 8
        case stadiumOrSports = 9
        case event = 10
        case officeBuilding = 11
        case borough = 12
        case business = 13
        case fitnesss = 14
        case condoBuilding = 47
        case intersection = 48
        case parkingSpot = 49
        case address = 82
        case zipcode = 83
    }
    
    // MARK: Methods
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.identifier = try values.decode(Int.self, forKey: .identifier)
        self.title = try values.decode(String.self, forKey: .title)
        self.streetAddress = try values.decode(String.self, forKey: .streetAddress)
        self.city = try values.decode(String.self, forKey: .city)
        self.state = try values.decode(String.self, forKey: .state)
        self.zipCode = try values.decode(String.self, forKey: .zipCode)
        self.latitude = try values.decode(Double.self, forKey: .latitude)
        self.longitude = try values.decode(Double.self, forKey: .longitude)
        self.airport = try values.decodeIfPresent(Airport.self, forKey: .airport)
        self.events = try values.decodeIfPresent([Event].self, forKey: .events)
        self.categories = try values.decodeIfPresent([DestinationCategory].self, forKey: .categories)
        
        let timeZoneIdentifier = try values.decode(String.self, forKey: .timeZone)
        self.timeZone = try TimeZone.safelyUnwrapped(fromIdentifier: timeZoneIdentifier)
        
        // Occasionally, `null` can be returned from the server. That's silly. Just get the strings.
        self.placeIDs = try values.decodeIfPresent([String?].self, forKey: .placeIDs)?.compactMap { $0 }
    }
    
    public init(identifier: Int,
                title: String,
                streetAddress: String,
                city: String,
                state: String,
                zipCode: String,
                timeZone: TimeZone,
                latitude: Double,
                longitude: Double,
                events: [Event]?,
                placeIDs: [String]?,
                airport: Airport?,
                categories: [DestinationCategory]?) {
        self.identifier = identifier
        self.title = title
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.timeZone = timeZone
        self.latitude = latitude
        self.longitude = longitude
        self.events = events
        self.placeIDs = placeIDs
        self.airport = airport
        self.categories = categories
    }
}
