// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// A network client for communicating with the SpotHero API.
public final class SpotHeroAPIClient {
    // MARK: Properties
    
    let networkClient: InternalNetworkClient
    
    // WIP: Endpoint definitions will be added here
    
    // MARK: Methods
    
    /// Creates a new instance of `SpotHeroAPIClient`.
    public init(baseURL: String) {
        self.networkClient = InternalNetworkClient(baseURL: baseURL)
    }
}
