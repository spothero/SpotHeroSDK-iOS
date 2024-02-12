// Copyright © 2021 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

protocol RequestDefining {
    associatedtype ResponseModel: Decodable
    associatedtype Route
    
    static var method: HTTPMethod { get }
    static var route: Route { get }
    
    var client: NetworkClient { get }
    
    init(client: NetworkClient)
}
