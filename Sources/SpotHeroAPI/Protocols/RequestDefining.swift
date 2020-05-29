// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

protocol RequestDefining {
    associatedtype Model: Decodable
    
    static var method: HTTPMethod { get }
    static var path: URLConvertible { get }
    var client: NetworkClient { get }
    
    init(client: NetworkClient)
}
