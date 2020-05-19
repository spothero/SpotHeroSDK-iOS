// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents a SpotHero API endpoint.
public class Endpoint {
    var client: InternalNetworkClient
    
    init(client: InternalNetworkClient) {
        self.client = client
    }
}
