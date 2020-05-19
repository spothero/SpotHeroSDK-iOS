// Copyright © 2020 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import XCTest

final class AirportEndpointTests: APITestCase {
    func testGetAirportsSucceeds() {
        self.stub(.get(AirportsEndpoint.Routes.airports), with: .relativeFile("../Resources/MockFiles/get_airports.json"))
        
        let client = SpotHeroAPIClient()
        
        let expectation = self.expectation(description: "Fetch airports.")
        
        client.airports.get { result in
            switch result {
            case let .success(airports):
                XCTAssertGreaterThan(airports.count, 0)
                
                for airport in airports {
                    let timeZoneIdentifier = airport.timeZoneIdentifier
                    XCTAssertNotNil(TimeZone(identifier: timeZoneIdentifier), "Could not convert \(timeZoneIdentifier) to a TimeZone.")
                }
            case let .failure(error):
                XCTFail("Error fetching airports. \(error.localizedDescription)")
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: Self.timeout)
    }
}
