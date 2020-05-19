// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// A network client for communicating with the SpotHero API.
public final class SpotHeroAPIClient {
    // MARK: Properties
    
    let networkClient: InternalNetworkClient
    
    /// Represents the `/airports` endpoint.
    public let airports: AirportsEndpoint
    
    /// Represents the `/destinations` endpoint.
    public let destinations: DestinationsEndpoint
    
    // MARK: Methods
    
    /// Creates a new instance of `SpotHeroAPIClient`.
    public init(baseURL: String) {
        self.networkClient = InternalNetworkClient(baseURL: baseURL)
        
        self.airports = AirportsEndpoint(client: self.networkClient)
        self.destinations = DestinationsEndpoint(client: self.networkClient)
    }
}
