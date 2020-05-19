// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents the SpotHero API Airports endpoint.
public final class AirportsEndpoint: Endpoint {
    public let get: AirportsGetRequest
    
    override init(client: InternalNetworkClient) {
        self.get = AirportsGetRequest(client: client)
        
        super.init(client: client)
    }
}
