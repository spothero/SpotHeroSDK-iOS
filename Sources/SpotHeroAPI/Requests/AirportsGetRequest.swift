// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

public struct AirportsGetRequest: RequestDefining {
    public typealias ResponseModel = [PartnerAirport]
    
    public static let method: HTTPMethod = .get
    public static let route = "/api/v1/airports"
    
    let client: NetworkClient
    
    init(client: NetworkClient) {
        self.client = client
    }
    
    @discardableResult
    func callAsFunction(completion: @escaping RequestCompletion<ResponseModel>) -> URLSessionTask? {
        return self.client.request(Self.self, completion: completion)
    }
}
