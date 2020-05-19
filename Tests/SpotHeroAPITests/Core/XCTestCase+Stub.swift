// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Sham
@testable import SpotHeroAPINext
import XCTest

public extension XCTestCase {
    func stub<T: RequestDefining>(_ route: T.Type, with response: StubResponse) {
        let request = StubRequest(method: T.method, url: T.path)
        MockService.shared.stub(request, with: response)
    }
}
