// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

protocol RequestDefining {
    associatedtype Model: Decodable
    
    static var method: HTTPMethod { get }
    static var path: URLConvertible { get }
    var client: InternalNetworkClient { get }
    
    init(client: InternalNetworkClient)
}

protocol GetRequestDefining: RequestDefining {
    @discardableResult
    func request(completion: @escaping RequestCompletion<Model>) -> URLSessionTask?
}

extension GetRequestDefining {
    static var method: HTTPMethod {
        return .get
    }
    
    @discardableResult
    func request(completion: @escaping RequestCompletion<Model>) -> URLSessionTask? {
        return self.client.request(Self.self, completion: completion)
    }
}
