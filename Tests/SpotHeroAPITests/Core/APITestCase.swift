// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Sham
@testable import SpotHeroAPINext
import XCTest

class APITestCase: XCTestCase {
    static var timeout: TimeInterval = 5
    static var baseURL: String = "https://mobile.staging.spothero.com"
    
    static func newAPIClient() -> SpotHeroAPIClient {
        return SpotHeroAPIClient(baseURL: Self.baseURL)
    }
}

class LiveAPITestCase: APITestCase {}

class MockAPITestCase: APITestCase {
    // Before all tests
    override class func setUp() {
        super.setUp()
        // Register the Sham MockService to start intercepting requests.
        MockService.shared.register()
        
        // We want to enable debug logging by default for verbose output.
        MockService.shared.isDebugLoggingEnabled = true
    }
    
    // Before each test
    override func setUp() {
        super.setUp()
        
        // Before each test, ensure that the MockService has been cleared of all stubbed requests.
        MockService.shared.clearData()
    }
}