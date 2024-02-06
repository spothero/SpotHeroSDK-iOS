// Copyright © 2024 SpotHero, Inc. All rights reserved.

import UtilityBeltNetworking

/// Represents a SpotHero API endpoint.
public class Endpoint {
    var client: NetworkClient
    var interceptor: RequestInterceptor

    init(client: NetworkClient, interceptor: RequestInterceptor) {
        self.client = client
        self.interceptor = interceptor
    }
}
