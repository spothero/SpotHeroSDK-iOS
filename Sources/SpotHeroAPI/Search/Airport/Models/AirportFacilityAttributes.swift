// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Attributes that apply to the facility for the airport parking type.
public struct AirportFacilityAttributes: Codable {
    private enum CodingKeys: String, CodingKey {
        case logo
        case redemptionInstructions = "redemption_instructions"
        case transportation
    }
    
    /// Logo for the business operating the facility.
    public let logo: Image?
    
    /// Information concerning the redemption process for customers who park at a facility.
    public let redemptionInstructions: AirportRedemptionInstructions
    
    /// Information about transportation between parking facility and the airport.
    public let transportation: AirportTransportation
}
