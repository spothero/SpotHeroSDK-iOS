// Copyright © 2020 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import XCTest

private protocol SearchGetTransientFacilityRequestTests: APITestCase {
    func testGetTransientFacilitiesSucceeds()
}

private extension SearchGetTransientFacilityRequestTests {
    /// Attempts to fetch a list of transient facilities, expecting success
    func getTransientFacility(withID facilityID: Int,
                              parameters: SearchGetTransientFacilityRequest.Parameters? = nil,
                              file: StaticString = #file,
                              line: UInt = #line) {
        let request = SearchGetTransientFacilityRequest(client: Self.newNetworkClient(for: .craig))
        let expectation = self.expectation(description: "Fetched transient facility.")
        
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

// swiftlint:disable:next type_name
final class SearchGetTransientFacilityRequestLiveTests: LiveAPITestCase, SearchGetTransientFacilityRequestTests {
    func testGetTransientFacilitiesSucceeds() {
        self.getTransientFacility(withID: TestData.facilityID)
    }
}

// swiftlint:disable:next type_name
final class SearchGetTransientFacilityRequestMockTests: MockAPITestCase, SearchGetTransientFacilityRequestTests {
    func testGetTransientFacilitiesSucceeds() {
        // FIXME: We temporarily need to stub on the /mobile path for staging requests.
        self.stub(.get("mobile\(SearchGetTransientFacilityRequest.route)/\(TestData.facilityID)"),
                  with: .apiMockFile("v2/Search/get_transient_facilities_\(TestData.facilityID).json"))
        
        self.getTransientFacility(withID: TestData.facilityID)
    }
}

private struct TestData {
    static let facilityID = 2175
    static let startDate = Date() // Today
}
