// Copyright © 2021 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import XCTest

private protocol SearchGetMonthlyFacilityRequestTests: APITestCase {
    func testGetMonthlyFacilitySucceeds() throws
}

private extension SearchGetMonthlyFacilityRequestTests {
    /// Attempts to fetch a monthly facility, expecting success
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
    func testGetMonthlyFacilitySucceeds() throws {
        throw XCTSkip("Skipping for now until monthly is updated on the staging environment.")
        
        self.getMonthlyFacility(withID: TestData.facilityID)
    }
}

final class SearchGetMonthlyFacilityRequestMockTests: MockAPITestCase, SearchGetMonthlyFacilityRequestTests {
    func testGetMonthlyFacilitySucceeds() throws {
        // FIXME: We temporarily need to stub on the /mobile path for staging requests.
        self.stub(.get("mobile\(SearchGetMonthlyFacilitiesRequest.route)/\(TestData.facilityID)"),
                  with: .apiMockFile("v2/Search/get_monthly_facilities_\(TestData.facilityID).json"))
        
        self.getMonthlyFacility(withID: TestData.facilityID)
    }
}

private enum TestData {
    static let facilityID = 769
}
