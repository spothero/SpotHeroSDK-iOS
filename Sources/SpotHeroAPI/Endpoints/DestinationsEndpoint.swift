// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

public final class DestinationsEndpoint: Endpoint {
    public let get: DestinationsGetByIDRequest
    
    override init(client: NetworkClient) {
        self.get = DestinationsGetByIDRequest(client: client)
        
        super.init(client: client)
    }
}
