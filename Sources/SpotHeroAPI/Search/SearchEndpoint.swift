// Copyright © 2023 SpotHero, Inc. All rights reserved.

import Foundation

public final class SearchEndpoint: Endpoint {
    public let getAirportFacility: SearchGetAirportFacilityRequest
    public let getAirportFacilities: SearchGetAirportFacilitiesRequest
    public let getMonthlyFacility: SearchGetMonthlyFacilityRequest
    public let getMonthlyFacilities: SearchGetMonthlyFacilitiesRequest
    public let getTransientFacility: SearchGetTransientFacilityRequest
    public let getTransientFacilities: SearchGetTransientFacilitiesRequest
    public let getBulkTransientFacility: BulkSearchGetTransientFacilityRequest
    public let getBulkTransientFacilities: BulkSearchGetTransientFacilitiesRequest
    
    override init(client: NetworkClient) {
        self.getAirportFacility = SearchGetAirportFacilityRequest(client: client)
        self.getAirportFacilities = SearchGetAirportFacilitiesRequest(client: client)
        self.getMonthlyFacility = SearchGetMonthlyFacilityRequest(client: client)
        self.getMonthlyFacilities = SearchGetMonthlyFacilitiesRequest(client: client)
        self.getTransientFacility = SearchGetTransientFacilityRequest(client: client)
        self.getTransientFacilities = SearchGetTransientFacilitiesRequest(client: client)
        self.getBulkTransientFacility = BulkSearchGetTransientFacilityRequest(client: client)
        self.getBulkTransientFacilities = BulkSearchGetTransientFacilitiesRequest(client: client)
        super.init(client: client)
    }
}
