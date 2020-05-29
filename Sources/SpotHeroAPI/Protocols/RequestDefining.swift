// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

protocol RequestDefining {
    associatedtype ResponseModel: Decodable
    associatedtype Route: URLConvertible
    
    var method: HTTPMethod { get }
    var route: Route { get }
}
