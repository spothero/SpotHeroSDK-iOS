// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

public struct AirportsGetRequest: RequestDefining {
    public typealias ResponseModel = [PartnerAirport]
    
    let method: HTTPMethod = .get
    let route = "/api/v1/airports"
}
