// Copyright © 2022 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// A network client for communicating with the SpotHero API.
public final class SpotHeroAPIClient {
    // MARK: Properties
    
    /// Represents the `/search` endpoint.
    public let search: SearchEndpoint
    
    // MARK: Methods
    
    /// Creates a new instance of `SpotHeroAPIClient`.
    /// - Parameters:
    ///   - baseURL: The base URL for all API requests.
    ///   - httpClient: An `HTTPClient` through which requests will be routed. Defaults to `.shared`.
    public init(baseURL: String, httpClient: HTTPClient = .shared, buildNumber: Int? = nil) {
        let networkClient = NetworkClient(baseURL: baseURL,
                                          httpClient: httpClient,
                                          buildNumber: buildNumber)
        
        /// V2 Endpoints
        self.search = SearchEndpoint(client: networkClient)
    }
}
