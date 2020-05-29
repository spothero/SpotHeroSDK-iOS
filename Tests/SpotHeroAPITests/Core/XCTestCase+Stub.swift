// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Sham
@testable import SpotHeroAPINext
import XCTest

public extension XCTestCase {
    /// Convenience method for stubbing new requests within an XCTestCase.
    /// - Parameter request: The request definition to stub.
    /// - Parameter response: The response to return.
    func stub<T: RequestDefining>(_ request: T, with response: StubResponse) {
        let stubRequest = StubRequest(method: request.method, url: request.route)
        MockService.shared.stub(stubRequest, with: response)
    }
}
