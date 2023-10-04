// Copyright © 2023 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import XCTest

private protocol SearchGetTransientFacilitiesRequestTests: APITestCase {
    func testGetTransientFacilitiesSucceeds() throws
}

private extension SearchGetTransientFacilitiesRequestTests {
    /// Attempts to fetch a list of transient facilities, expecting success
    func getTransientFacilities(parameters: SearchGetTransientFacilitiesRequest.Parameters,
                                file: StaticString = #file,
                                line: UInt = #line) {
        let request = SearchGetTransientFacilitiesRequest(client: Self.newNetworkClient(for: .craig))
        let expectation = self.expectation(description: "Fetched transient facilities.")
        
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
final class SearchGetTransientFacilitiesRequestLiveTests: LiveAPITestCase, SearchGetTransientFacilitiesRequestTests {
    func testGetTransientFacilitiesSucceeds() throws {
        self.getTransientFacilities(parameters: .init(latitude: TestData.latitude,
                                                      longitude: TestData.longitude,
                                                      startDate: TestData.startDate))
    }
}

// swiftlint:disable:next type_name
final class SearchGetTransientFacilitiesRequestMockTests: MockAPITestCase, SearchGetTransientFacilitiesRequestTests {
    func testGetTransientFacilitiesSucceeds() throws {
        throw XCTSkip("Skipping mock tests until Search V2 development is complete.")
        
        // FIXME: We temporarily need to stub on the /mobile path for staging requests.
        /*
        self.stub(SearchGetTransientFacilitiesRequest.self,
                  with: .apiMockFile("get_transient_facilities"))
        
        self.getTransientFacilities(parameters: .init(latitude: TestData.latitude,
                                                      longitude: TestData.longitude,
                                                      startDate: TestData.startDate))
         */
    }
}

private enum TestData {
    static let latitude: Double = 41.8781 // Chicago Latitude
    static let longitude: Double = -87.6298 // Chicago Longitude
    static let startDate = Date() // Today
}
