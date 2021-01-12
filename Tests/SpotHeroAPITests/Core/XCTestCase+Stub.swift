// Copyright © 2021 SpotHero, Inc. All rights reserved.

import Sham
@testable import SpotHeroAPINext
import UtilityBeltNetworking
import XCTest

public extension XCTestCase {
    /// Convenience method for stubbing new requests within an XCTestCase.
    /// - Parameter request: The request definition to stub.
    /// - Parameter response: The response to return.
    func stub<T: RequestDefining>(_ request: T.Type, with response: StubResponse) where T.Route == String {
        // FIXME: We temporarily need to stub on the /mobile path for staging requests.
        let url = "mobile\(T.route)"
        let stubRequest = StubRequest(method: T.method, url: url)
        MockService.shared.stub(stubRequest, with: response)
    }
    
    /// Convenience method for stubbing new requests within an XCTestCase.
    /// - Parameter request: The request definition to stub.
    /// - Parameter response: The response to return.
    func stub<T: RequestDefining>(_ request: T.Type, with response: StubResponse) where T.Route == URLConvertible {
        // FIXME: We temporarily need to stub on the /mobile path for staging requests.
        let url = "mobile\(T.route)"
        let stubRequest = StubRequest(method: T.method, url: url)
        MockService.shared.stub(stubRequest, with: response)
    }
}
