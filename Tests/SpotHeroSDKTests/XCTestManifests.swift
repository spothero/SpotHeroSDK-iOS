import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SpotHeroSDK_iOSTests.allTests),
    ]
}
#endif
