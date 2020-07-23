// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Attributes that apply to the facility for the airport parking type.
public struct AirportFacilityAttributes: Codable {
    /// Logo(s) for the business operating the facility.
    public let logos: [Image]
    
    /// Information concerning the redemption process for customers who park at a facility.
    public let redemption: Redemption<AirportRedemptionInstructions>
    
    /// Information about transportation between parking facility and the airport.
    public let transportation: AirportTransportation
}
