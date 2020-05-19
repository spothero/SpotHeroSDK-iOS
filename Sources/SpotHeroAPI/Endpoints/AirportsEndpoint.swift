// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

protocol MonolithEndpoint {
    var client: InternalNetworkClient { get }
    var baseRoute: String { get }
    
    init(client: InternalNetworkClient)
}

// extension MonolithEndpoint {
//    @discardableResult
//    public func get(completion: @escaping RequestCompletion<[Airport]>) -> URLSessionTask? {
//        return self.client.request("https://mobile.staging.spothero.com/api/v1/airports", method: .get) { result in
//            completion(result)
//        }
//    }
//
//    @discardableResult
//    public func get<T: Route>(completion: @escaping RequestCompletion<T>) -> URLSessionTask? {
//        return self.client.request("https://mobile.staging.spothero.com/api/v1/airports", method: .get) { result in
//            completion(result)
//        }
//    }
// }

struct MonolithRoute {
//    typealias DataType = T.Type
    
    let method: HTTPMethod
    let url: URLConvertible
//    let dataType: DataType
}

/// Represents the SpotHero API Airports endpoint.
public final class AirportsEndpoint: MonolithEndpoint {
    let client: InternalNetworkClient
    let baseRoute = "/api/v1/airports"
    
    init(client: InternalNetworkClient) {
        self.client = client
    }
    
    enum Routes: String {
        case airports
    }
    
    /// Get a list of available partner airports.
    /// - Parameter completion: A completion block for processing the result of the request.
    /// - Returns: The task performing this action, or nil if a failure occurs before the request hits the network.
    @discardableResult
    public func get(completion: @escaping RequestCompletion<[Airport]>) -> URLSessionTask? {
        return self.client.request("https://mobile.staging.spothero.com/api/v1/airports", method: .get) { result in
            completion(result)
        }
    }
}
