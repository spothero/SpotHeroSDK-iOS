// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

public final class Airport: Codable {
    // MARK: Properties
    
    /// The IATA code of the airport.
    public let iataCode: String
    
    /// The name of the airport.
    public let name: String
    
    // MARK: Enums
    
    enum CodingKeys: String, CodingKey {
        case iataCode = "iata_code"
        case name = "airport_name"
    }
    
    // MARK: Methods
    
    public init(iataCode: String, name: String) {
        self.iataCode = iataCode
        self.name = name
    }
}
