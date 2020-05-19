// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents the SpotHero API Airports endpoint.
public final class AirportsEndpoint: Endpoint {
    enum Routes: String, MonolithRoute {
        case airports
    }
    
    /// Get a list of available partner airports.
    /// - Parameter completion: A completion block for processing the result of the request.
    /// - Returns: The task performing this action, or nil if a failure occurs before the request hits the network.
    @discardableResult
    public func get(completion: @escaping RequestCompletion<[Airport]>) -> URLSessionTask? {
        return self.client.request(Routes.airports, method: .get) { result in
            completion(result)
        }
    }
}
