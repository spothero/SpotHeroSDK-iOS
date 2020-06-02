// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

public final class DestinationsEndpoint: Endpoint {
    public let getByID: DestinationsGetByIDRequest
    
    override init(client: NetworkClient) {
        self.getByID = DestinationsGetByIDRequest(client: client)
        
        super.init(client: client)
    }
}
