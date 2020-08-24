// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// A network client for communicating with the SpotHero API.
public final class SpotHeroAPIClient {
    // MARK: Enums
    
    /// The API environment for all network requests.
    public enum Environment {
        /// Represents the SpotHero mobile staging environment.
        case mobileStaging
        /// Represents the SpotHero staging environment.
        case staging
        /// Represents the SpotHero production environment.
        case production
        /// Represents a SpotHero sandbox environment, which requires a URL.
        case sandbox(url: URLConvertible)
        
        /// The base URL for the API.
        var baseURL: URLConvertible {
            switch self {
            case .mobileStaging:
                return "https://api.sandbox.spothero.com"
            case .staging:
                return ""
            case .production:
                return ""
            case let .sandbox(url):
                return url
            }
        }
    }
    
    // MARK: Properties
    
    let networkClient: NetworkClient
    
    // WIP: Endpoint definitions will be added here
    
    // MARK: Methods
    
    /// Creates a new instance of `SpotHeroAPIClient`.
    public init(environment: Environment) {
        self.networkClient = NetworkClient(baseURL: environment.baseURL)
    }
}
