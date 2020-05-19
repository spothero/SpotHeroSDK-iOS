// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

protocol MonolithRoute: URLConvertible, RawRepresentable {
    var baseRoute: String { get }
}

extension MonolithRoute where RawValue == String {
    func asURL() throws -> URL {
        return try "\(self.baseRoute)/\(self.rawValue)".asURL()
    }
}

extension MonolithRoute {
    var baseRoute: String {
        return "/api/v1"
    }
}
