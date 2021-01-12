// Copyright © 2021 SpotHero, Inc. All rights reserved.

import Sham
@testable import SpotHeroAPINext
import XCTest

class APITestCase: XCTestCase {
    enum ServiceURL: String {
        case monolith = "https://mobile.staging.spothero.com"
        case craig = "https://api.staging.spothero.com/mobile"
    }
    
    static var timeout: TimeInterval = 15
    
    static func newAPIClient(for service: ServiceURL) -> SpotHeroAPIClient {
        return SpotHeroAPIClient(baseURL: service.rawValue)
    }
    
    static func newNetworkClient(for service: ServiceURL) -> NetworkClient {
        return NetworkClient(baseURL: service.rawValue)
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
    
    // After all tests
    override class func tearDown() {
        super.tearDown()
        
        // Unregister the Sham MockService to stop intercepting requests.
        MockService.shared.unregister()
    }
}
