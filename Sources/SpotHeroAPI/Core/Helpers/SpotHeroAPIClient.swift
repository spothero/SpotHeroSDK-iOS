// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// A network client for communicating with the SpotHero API.
public final class SpotHeroAPIClient {
    // MARK: Properties
    
    /// Represents the `/search` endpoint.
    public let search: SearchEndpoint
    
    // MARK: Methods
    
    /// Creates a new instance of `SpotHeroAPIClient`.
    public init(baseURL: String) {
        let networkClient = NetworkClient(baseURL: baseURL)
        
        /// V2 Endpoints
        self.search = SearchEndpoint(client: networkClient)
    }
}
