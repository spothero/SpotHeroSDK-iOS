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
    
    let client: NetworkClient
    let method: HTTPMethod = .get
    
    var route: String {
        return "/api/v1/destinations/\(self.destinationID)"
    }
    
    private let destinationID: Int
    
    init(client: NetworkClient, destinationID: Int) {
        self.client = client
        self.destinationID = destinationID
    }
    
    /// Fetches the detailed information about a single destination using its identifier.
    ///
    /// - Parameters:
    ///   - destinationID: The identifier of the de to retrieve details for.
    ///   - completion: A Result block containing either a destination or an error
    /// - Returns: The URLSessionTask created by the request, or nil if the request failed before hitting the network.
    @discardableResult
    public func request(completion: @escaping RequestCompletion<ResponseModel>) -> URLSessionTask? {
        let includes = [
            IncludeKey.airport.rawValue,
            IncludeKey.places_place_ids.rawValue,
        ].joined(separator: ",")
        
        let parameters = [ParameterKey.include.rawValue: includes]
        
        return self.client.request(self,
                                   parameters: parameters,
                                   completion: completion)
    }
}
