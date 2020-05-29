// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

protocol RequestDefining {
    associatedtype ResponseModel: Decodable
    
    static var method: HTTPMethod { get }
    var client: NetworkClient { get }
    
    init(client: NetworkClient)
}

protocol SimpleRouteDefining {
    associatedtype Route: URLConvertible
    static var route: Route { get }
}
