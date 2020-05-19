// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

public final class DestinationsEndpoint: Endpoint {
    enum JSONParameterKey: String {
        case include
    }
    
    enum JSONIncludeKey: String {
        case airport
        case places_place_ids
    }
    
    enum Routes: MonolithRoute {
        case destination(Int)
        
        var rawValue: String {
            switch self {
            case let .destination(destinationID):
                return "destinations/\(destinationID)"
            }
        }
    }
    
    /// Fetches the detailed information about a single destination using its identifier.
    ///
    /// - Parameters:
    ///   - destinationID: The identifier of the de to retrieve details for.
    ///   - completion: A Result block containing either a destination or an error
    /// - Returns: The URLSessionTask created by the request, or nil if the request failed before hitting the network.
    @discardableResult
    public func get(id destinationID: Int, completion: @escaping RequestCompletion<Destination>) -> URLSessionTask? {
        let includes = [
            JSONIncludeKey.airport.rawValue,
            JSONIncludeKey.places_place_ids.rawValue,
        ].joined(separator: ",")
        
        let parameters = [JSONParameterKey.include.rawValue: includes]
        
        return self.client.request(Routes.destination(destinationID),
                                   method: .get,
                                   parameters: parameters,
                                   completion: completion)
    }
}
