// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Sham
import UtilityBeltNetworking

extension StubResponse {
    /// Returns a SpotHeroAPI mock file. This abstraction layer allows easy conversion if the directory changes,
    /// or when Swift Package Manager can successfully work with resource bundles.
    /// - Parameter file: The name of the mock file.
    /// - Parameter statusCode: The HTTP status code to return. Defaults to 200 OK.
    /// - Parameter headers: The headers to return in the response.
    static func apiMockFile(_ file: String,
                            statusCode: HTTPStatusCode = .ok,
                            headers: [String: String] = [:]) -> StubResponse {
        return .relativeFile("../Resources/MockFiles.bundle/\(file)",
                             statusCode: statusCode,
                             headers: headers)
    }
}
