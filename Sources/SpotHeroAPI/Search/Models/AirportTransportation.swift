// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Information about transportation between parking facility and the airport.
public struct AirportTransportation: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case contactPhoneNumber = "contact_phone_number"
        case schedule
        case images
        case hoursOfOperation = "hours_of_operation"
    }
    
    /// Defines the type of transportation provided at an airport facility.
    public enum TransportationType: String, Codable {
        /// Airport curbside dropoff is available.
        case curbsideValet = "curbside_valet"
        
        /// Free shuttle transportation on demand.
        case onDemandShuttle = "on_demand_shuttle"
        
        /// There is nearby access to public transportation.
        case publicTransit = "public_transit"
        
        /// A free shuttle runs on a scheduled frequency.
        case scheduledShuttle = "scheduled_shuttle"
        
        /// Taxi and/or rideshare options are available.
        case taxi
    }
    
    /// Defines the type of airport transportation provided at the facility.
    public let type: TransportationType
    
    /// The phone number for shuttle support.
    public let contactPhoneNumber: String
    
    /// Details about how often the shuttle runs.
    public let schedule: Schedule?
    
    /// Image(s) of facility shuttle.
    public let images: [Image]
    
    /// Represents when a facility is open for business.
    public let hoursOfOperation: HoursOfOperation
}
