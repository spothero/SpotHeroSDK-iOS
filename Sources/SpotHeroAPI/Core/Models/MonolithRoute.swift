// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

protocol MonolithRoute {
    var basePath: String { get }
    var rawValue: String { get }
    var fullPath: String { get }
}

// extension MonolithRoute where Self : RawRepresentable, RawValue == String {
//    func asURL() throws -> URL {
//        return try "\(self.baseRoute)/\(self.rawValue)".asURL()
//    }
// }

extension MonolithRoute {
    var basePath: String {
        return "/api/v1"
    }
    
    var fullPath: String {
        return "\(self.basePath)/\(self.rawValue)"
    }
    
    func asURL() throws -> URL {
        return try "\(self.basePath)/\(self.rawValue)".asURL()
    }
}
