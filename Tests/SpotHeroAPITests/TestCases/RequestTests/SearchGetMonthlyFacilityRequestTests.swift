// Copyright © 2020 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import XCTest

private protocol SearchGetMonthlyFacilityRequestTests: APITestCase {
    func testGetMonthlyFacilitySucceeds()
}

private extension SearchGetMonthlyFacilityRequestTests {
    /// Attempts to fetch a list of monthly facility, expecting success
    func getMonthlyFacility(withID facilityID: Int,
                            parameters: SearchGetMonthlyFacilityRequest.Parameters? = nil,
                            file: StaticString = #file,
                            line: UInt = #line) {
        let request = SearchGetMonthlyFacilityRequest(client: Self.newNetworkClient(for: .craig))
        let expectation = self.expectation(description: "Fetched monthly facility.")
        
        request(withID: facilityID, parameters: parameters) { result in
            switch result {
            case let .success(response):
                // WIP: Better tests
                XCTAssertNotNil(response, file: file, line: line)
            case let .failure(error):
                XCTFail("Error fetching facility! \(error.localizedDescription)", file: file, line: line)
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: Self.timeout)
    }
}

final class SearchGetMonthlyFacilityRequestLiveTests: LiveAPITestCase, SearchGetMonthlyFacilityRequestTests {
    func testGetMonthlyFacilitySucceeds() {
        self.getMonthlyFacility(withID: TestData.facilityID)
    }
}

final class SearchGetMonthlyFacilityRequestMockTests: MockAPITestCase, SearchGetMonthlyFacilityRequestTests {
    func testGetMonthlyFacilitySucceeds() {
        self.stub(.get("\(SearchGetMonthlyFacilitiesRequest.route)/\(TestData.facilityID)"),
                  with: .apiMockFile("CRAIG/Search/get_monthly_facilities_\(TestData.facilityID).json"))
        
        self.getMonthlyFacility(withID: TestData.facilityID)
    }
}

private struct TestData {
    static let facilityID = 769
}
