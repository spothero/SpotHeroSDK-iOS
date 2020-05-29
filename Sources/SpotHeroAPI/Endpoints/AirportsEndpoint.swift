// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents the SpotHero API Airports endpoint.
public final class AirportsEndpoint: Endpoint {
    @discardableResult
    public func get(completion: @escaping RequestCompletion<[PartnerAirport]>) -> URLSessionTask? {
        let request = AirportsGetRequest()
        return self.client.request(request, completion: completion)
    }
}
