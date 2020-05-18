// Copyright © 2020 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import XCTest

final class SpotHeroAPITests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SpotHeroAPI().text, "Hello, World!")
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}
