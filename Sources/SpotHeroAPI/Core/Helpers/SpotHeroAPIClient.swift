// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// A network client for communicating with the SpotHero API.
public final class SpotHeroAPIClient {
    // MARK: Properties
    
    let networkClient: NetworkClient
    
    /// Represents the `/airports` endpoint.
    public let airports: AirportsEndpoint
    
    // MARK: Methods
    
    /// Creates a new instance of `SpotHeroAPIClient`.
    public init(baseURL: String) {
        self.networkClient = NetworkClient(baseURL: baseURL)
        
        self.airports = AirportsEndpoint(client: self.networkClient)
    }
}
