// Copyright © 2021 SpotHero, Inc. All rights reserved.

import Foundation
import Sham
import UtilityBeltNetworking

extension StubResponse {
    /// Returns a SpotHeroAPI mock file. This abstraction layer allows easy conversion if the directory changes,
    /// or when Swift Package Manager can successfully work with resource bundles.
    /// - Parameter file: The name of the mock file, without the .json extension.
    /// - Parameter statusCode: The HTTP status code to return. Defaults to 200 OK.
    /// - Parameter headers: The headers to return in the response.
    static func apiMockFile(_ file: String,
                            bundle: Bundle = .module,
                            statusCode: HTTPStatusCode = .ok,
                            headers: [String: String] = [:]) -> StubResponse {
        return .resource(file,
                         fileExtension: "json",
                         bundle: bundle,
                         statusCode: statusCode,
                         headers: headers)
    }
}
