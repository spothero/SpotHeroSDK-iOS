// Copyright © 2023 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

public final class SearchEndpoint: Endpoint {
    public let getAirportFacility: SearchGetAirportFacilityRequest
    public let getAirportFacilities: SearchGetAirportFacilitiesRequest
    public let getMonthlyFacility: SearchGetMonthlyFacilityRequest
    public let getMonthlyFacilities: SearchGetMonthlyFacilitiesRequest
    public let getTransientFacility: SearchGetTransientFacilityRequest
    public let getTransientFacilityExtensionRates: SearchGetTransientExtensionRates
    public let getTransientFacilities: SearchGetTransientFacilitiesRequest
    public let getBulkTransientFacility: BulkSearchGetTransientFacilityRequest
    public let getBulkTransientFacilities: BulkSearchGetTransientFacilitiesRequest
    
    override init(client: NetworkClient, interceptor: RequestInterceptor) {
        self.getAirportFacility = SearchGetAirportFacilityRequest(client: client, interceptor: interceptor)
        self.getAirportFacilities = SearchGetAirportFacilitiesRequest(client: client, interceptor: interceptor)
        self.getMonthlyFacility = SearchGetMonthlyFacilityRequest(client: client, interceptor: interceptor)
        self.getMonthlyFacilities = SearchGetMonthlyFacilitiesRequest(client: client, interceptor: interceptor)
        self.getTransientFacility = SearchGetTransientFacilityRequest(client: client, interceptor: interceptor)
        self.getTransientFacilityExtensionRates = SearchGetTransientExtensionRates(client: client, interceptor: interceptor)
        self.getTransientFacilities = SearchGetTransientFacilitiesRequest(client: client, interceptor: interceptor)
        self.getBulkTransientFacility = BulkSearchGetTransientFacilityRequest(client: client, interceptor: interceptor)
        self.getBulkTransientFacilities = BulkSearchGetTransientFacilitiesRequest(client: client, interceptor: interceptor)
        super.init(client: client, interceptor: interceptor)
    }
}
