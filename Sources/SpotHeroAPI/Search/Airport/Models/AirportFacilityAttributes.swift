// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Attributes that apply to the facility for the airport parking type.
public struct AirportFacilityAttributes: Codable {
    private enum CodingKeys: String, CodingKey {
        case logos
        case redemptionInstructions = "redemption_instructions"
        case transportation
    }
    
    /// Logo(s) for the business operating the facility.
    public let logos: [Image]
    
    /// Information concerning the redemption process for customers who park at a facility.
    public let redemptionInstructions: AirportRedemptionInstructions
    
    /// Information about transportation between parking facility and the airport.
    public let transportation: AirportTransportation
}
