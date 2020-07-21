// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

public final class SearchEndpoint: Endpoint {
    public let getMonthlyFacilities: SearchGetMonthlyFacilitiesRequest
    
    override init(client: NetworkClient) {
        self.getMonthlyFacilities = SearchGetMonthlyFacilitiesRequest(client: client)
        
        super.init(client: client)
    }
}
