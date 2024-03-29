// Copyright © 2024 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import XCTest

private protocol SearchGetAirportFacilityRequestTests: APITestCase {
    func testGetAirportFacilitiesSucceeds() throws
}

private extension SearchGetAirportFacilityRequestTests {
    /// Attempts to fetch a list of airport facilities, expecting success
    func getAirportFacility(withID facilityID: Int,
                            parameters: SearchGetAirportFacilityRequest.Parameters? = nil,
                            file: StaticString = #file,
                            line: UInt = #line) {
        let request = SearchGetAirportFacilityRequest(client: Self.newNetworkClient(for: .craig))
        let expectation = self.expectation(description: "Fetched airport facility.")
        
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

final class SearchGetAirportFacilityRequestLiveTests: LiveAPITestCase, SearchGetAirportFacilityRequestTests {
    func testGetAirportFacilitiesSucceeds() throws {
        self.getAirportFacility(withID: TestData.facilityID)
    }
}

private enum TestData {
    static let facilityID = 3425
    static let startDate = Date() // Today
}
