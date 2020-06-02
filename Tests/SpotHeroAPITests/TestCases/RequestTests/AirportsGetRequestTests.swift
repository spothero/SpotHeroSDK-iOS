// Copyright © 2020 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import XCTest

private protocol AirportsGetRequestTests: APITestCase {
    func testGetAirportsSucceeds()
}

extension AirportsGetRequestTests {
    /// Attempts to fetch all airports, expecting success.
    func getAirports(file: StaticString = #file, line: UInt = #line) {
        let request = AirportsGetRequest(client: Self.newNetworkClient())
        let expectation = self.expectation(description: "Fetch airports.")
        
        request { result -> Void in
            switch result {
            case let .success(airports):
                XCTAssertGreaterThan(airports.count, 0, file: file, line: line)
                
                for airport in airports {
                    do {
                        _ = try TimeZone.safelyUnwrapped(fromIdentifier: airport.timeZoneIdentifier)
                    } catch {
                        XCTFail(error.localizedDescription, file: file, line: line)
                    }
                }
            case let .failure(error):
                XCTFail("Error fetching airports. \(error.localizedDescription)", file: file, line: line)
            }
            
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: Self.timeout)
    }
}

final class AirportsGetRequestLiveTests: LiveAPITestCase, AirportsGetRequestTests {
    func testGetAirportsSucceeds() {
        self.getAirports()
    }
}

final class AirportsGetRequestMockTests: MockAPITestCase, AirportsGetRequestTests {
    func testGetAirportsSucceeds() {
        self.stub(AirportsGetRequest.self, with: .apiMockFile("Airports/get_airports.json"))
        
        self.getAirports()
    }
}
