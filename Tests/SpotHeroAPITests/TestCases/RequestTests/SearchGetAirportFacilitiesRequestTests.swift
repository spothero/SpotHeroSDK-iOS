// Copyright © 2021 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import XCTest

private protocol SearchGetAirportFacilitiesRequestTests: APITestCase {
    func testGetAirportFacilitiesSucceeds()
}

private extension SearchGetAirportFacilitiesRequestTests {
    /// Attempts to fetch a list of airport facilities, expecting success
    func getAirportFacilities(parameters: SearchGetAirportFacilitiesRequest.Parameters,
                              file: StaticString = #file,
                              line: UInt = #line) {
        let request = SearchGetAirportFacilitiesRequest(client: Self.newNetworkClient(for: .craig))
        let expectation = self.expectation(description: "Fetched airport facilities.")
        
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
