// Copyright © 2020 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import XCTest

private protocol SearchGetMonthlyFacilitiesRequestTests: APITestCase {
    func testGetMonthlyFacilitiesSucceeds() throws
}

private extension SearchGetMonthlyFacilitiesRequestTests {
    /// Attempts to fetch a list of monthly facilities, expecting success
    func getMonthlyFacilities(parameters: SearchGetMonthlyFacilitiesRequest.Parameters,
                              file: StaticString = #file,
                              line: UInt = #line) {
        let request = SearchGetMonthlyFacilitiesRequest(client: Self.newNetworkClient(for: .craig))
        let expectation = self.expectation(description: "Fetched monthly facilities.")
        request(parameters: parameters) { result in
            switch result {
            case let .success(response):
                // WIP: Better tests
                XCTAssertGreaterThan(response.results.count, 0, file: file, line: line)
            case let .failure(error):
                XCTFail("Error fetching facilities! \(error.localizedDescription)", file: file, line: line)
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: Self.timeout)
    }
}

// swiftlint:disable:next type_name
final class SearchGetMonthlyFacilitiesRequestLiveTests: LiveAPITestCase, SearchGetMonthlyFacilitiesRequestTests {
    func testGetMonthlyFacilitiesSucceeds() throws {
        throw XCTSkip("Skipping for now until monthly is updated on the staging environment.")
        
        self.getMonthlyFacilities(parameters: .init(latitude: TestData.latitude,
                                                    longitude: TestData.longitude,
                                                    startDate: TestData.startDate))
    }
}

// swiftlint:disable:next type_name
final class SearchGetMonthlyFacilitiesRequestMockTests: MockAPITestCase, SearchGetMonthlyFacilitiesRequestTests {
    func testGetMonthlyFacilitiesSucceeds() throws {
        self.stub(SearchGetMonthlyFacilitiesRequest.self,
                  with: .apiMockFile("v2/Search/get_monthly_facilities.json"))
        
        self.getMonthlyFacilities(parameters: .init(latitude: TestData.latitude,
                                                    longitude: TestData.longitude,
                                                    startDate: TestData.startDate))
    }
}

private struct TestData {
    static let latitude: Double = 41.8781 // Chicago Latitude
    static let longitude: Double = -87.6298 // Chicago Longitude
    static let startDate = Date() // Today
}
