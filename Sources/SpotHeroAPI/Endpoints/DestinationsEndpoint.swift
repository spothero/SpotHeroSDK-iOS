// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

public final class DestinationsEndpoint: Endpoint {
    public let getSingle: DestinationsGetSingleRequest
    
    override init(client: NetworkClient) {
        self.getSingle = DestinationsGetSingleRequest(client: client)
        
        super.init(client: client)
    }
}
