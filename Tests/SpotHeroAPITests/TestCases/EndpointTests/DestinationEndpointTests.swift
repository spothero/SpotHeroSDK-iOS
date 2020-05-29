// Copyright © 2020 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import XCTest

private protocol DestinationEndpointTests: APITestCase {
    func testGetDestinationSucceeds()
}

extension DestinationEndpointTests {
    /// Attempts to fetch a single destination, expecting success.
    func getDestination(id destinationID: Int) {
        let client = Self.newAPIClient()
        
        let expectation = self.expectation(description: "Destination retrieved successfully")
        
        client.destinations.get(id: destinationID).request { result in
            expectation.fulfill()
            
            switch result {
            case let .success(destination):
                do {
                    // Is this the correct destination
                    XCTAssertEqual(destination.identifier, destinationID)
                    
                    let categories = try XCTUnwrap(destination.categories)
                    XCTAssertFalse(categories.isEmpty)
                    
                    let placeIDs = try XCTUnwrap(destination.placeIDs)
                    XCTAssertFalse(placeIDs.isEmpty)
                    
                    // airport information should be nil
                    XCTAssertNil(destination.airport)
                } catch {
                    XCTFail("Error getting Destination \(destinationID): \(error.localizedDescription)")
                }
            case let .failure(error):
                XCTFail("Error getting Destination \(destinationID): \(error.localizedDescription)")
            }
        }
        
        self.waitForExpectations(timeout: Self.timeout)
    }
}

final class DestinationEndpointLiveTests: LiveAPITestCase, DestinationEndpointTests {
    private static let validTransientDestinationID = 1
    private static let validAirportDestinationID = 583 // ORD
    
    func testGetDestinationSucceeds() {
        self.getDestination(id: Self.validTransientDestinationID)
    }
}

final class DestinationEndpointMockTests: MockAPITestCase, DestinationEndpointTests {
    private static let validTransientDestinationID = 1
    private static let validAirportDestinationID = 583 // ORD
    
    func testGetDestinationSucceeds() {
        let destinationID = Self.validTransientDestinationID
        
        // TODO: Temporarily commented out
//        self.stub(.get(DestinationsGetByIDRequest.route(destinationID)),
//                  with: .apiMockFile("Destinations/get_destinations_\(destinationID).json"))
        
        self.getDestination(id: destinationID)
    }
}
