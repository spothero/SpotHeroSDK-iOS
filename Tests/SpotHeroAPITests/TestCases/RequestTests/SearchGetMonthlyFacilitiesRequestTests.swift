// Copyright © 2020 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import XCTest

private protocol SearchGetMonthlyFacilitiesRequestTests: APITestCase {
    func testGetMonthlyFacilitiesSucceeds()
}

private extension SearchGetMonthlyFacilitiesRequestTests {
    /// Attempts to fetch a list of monthly facilities, expecting success
    func getMonthlyFacilities(latitude: Double, longitude: Double, startDate: Date) {
        let request = SearchGetMonthlyFacilitiesRequest(client: Self.newNetworkClient(for: .craig))
        let expectation = self.expectation(description: "Fetched monthly facilities.")
        
        let parameters = SearchGetMonthlyFacilitiesRequest.Parameters(latitude: latitude,
                                                                      longitude: longitude,
                                                                      startDate: startDate)
        
        request(parameters: parameters) { result in
            expectation.fulfill()
            
            switch result {
            case let .success(response):
                XCTAssertGreaterThan(response.results.count, 0)
            case let .failure(error):
                XCTFail("Error fetching facilities! \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: Self.timeout)
    }
}

// swiftlint:disable:next type_name
final class SearchGetMonthlyFacilitiesRequestLiveTests: LiveAPITestCase, SearchGetMonthlyFacilitiesRequestTests {
    private static let latitude: Double = 41.8781 // Chicago Latitude
    private static let longitude: Double = 87.6298 // Chicago Longitude
    private static let startDate = Date() // Today
    
    func testGetMonthlyFacilitiesSucceeds() {
        self.getMonthlyFacilities(latitude: Self.latitude,
                                  longitude: Self.longitude,
                                  startDate: Self.startDate)
    }
}
