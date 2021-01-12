// Copyright © 2021 SpotHero, Inc. All rights reserved.

import Foundation

public final class SearchEndpoint: Endpoint {
    public let getAirportFacility: SearchGetAirportFacilityRequest
    public let getAirportFacilities: SearchGetAirportFacilitiesRequest
    public let getMonthlyFacility: SearchGetMonthlyFacilityRequest
    public let getMonthlyFacilities: SearchGetMonthlyFacilitiesRequest
    public let getTransientFacility: SearchGetTransientFacilityRequest
    public let getTransientFacilities: SearchGetTransientFacilitiesRequest
    
    override init(client: NetworkClient) {
        self.getAirportFacility = SearchGetAirportFacilityRequest(client: client)
        self.getAirportFacilities = SearchGetAirportFacilitiesRequest(client: client)
        self.getMonthlyFacility = SearchGetMonthlyFacilityRequest(client: client)
        self.getMonthlyFacilities = SearchGetMonthlyFacilitiesRequest(client: client)
        self.getTransientFacility = SearchGetTransientFacilityRequest(client: client)
        self.getTransientFacilities = SearchGetTransientFacilitiesRequest(client: client)
        
        super.init(client: client)
    }
}
