// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

public struct DestinationsGetByIDRequest: RequestDefining {
    public typealias ResponseModel = Destination
    
    private enum ParameterKey: String {
        case include
    }
    
    private enum IncludeKey: String {
        case airport
        case places_place_ids
    }
    
    public static let method: HTTPMethod = .get
    
    let client: NetworkClient
    
    init(client: NetworkClient) {
        self.client = client
    }
    
    public static func route(_ destinationID: Int) -> URLConvertible {
        return "/api/v1/destinations/\(destinationID)"
    }
    
    /// Fetches the detailed information about a single destination using its identifier.
    ///
    /// - Parameters:
    ///   - destinationID: The identifier of the de to retrieve details for.
    ///   - completion: A Result block containing either a destination or an error
    /// - Returns: The URLSessionTask created by the request, or nil if the request failed before hitting the network.
    @discardableResult
    public func callAsFunction(id destinationID: Int, completion: @escaping RequestCompletion<ResponseModel>) -> URLSessionTask? {
        let includes = [
            IncludeKey.airport.rawValue,
            IncludeKey.places_place_ids.rawValue,
        ].joined(separator: ",")
        
        let parameters = [ParameterKey.include.rawValue: includes]
        
        return self.client.request(route: Self.route(destinationID),
                                   method: Self.method,
                                   parameters: parameters,
                                   completion: completion)
    }
}
