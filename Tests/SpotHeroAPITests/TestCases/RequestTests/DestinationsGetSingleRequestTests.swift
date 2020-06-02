// Copyright © 2020 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import XCTest

private protocol DestinationsGetSingleRequestTests: APITestCase {
    func testGetDestinationSucceeds()
}

extension DestinationsGetSingleRequestTests {
    /// Attempts to fetch a single destination, expecting success.
    func getDestination(id destinationID: Int) {
        let request = DestinationsGetSingleRequest(client: Self.newNetworkClient())
        let expectation = self.expectation(description: "Destination retrieved successfully")
        
        request(withID: destinationID) { result in
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

final class DestinationsGetSingleRequestLiveTests: LiveAPITestCase, DestinationsGetSingleRequestTests {
    private static let validTransientDestinationID = 1
    private static let validAirportDestinationID = 583 // ORD
    
    func testGetDestinationSucceeds() {
        self.getDestination(id: Self.validTransientDestinationID)
    }
}

final class DestinationsGetSingleRequestMockTests: MockAPITestCase, DestinationsGetSingleRequestTests {
    private static let validTransientDestinationID = 1
    private static let validAirportDestinationID = 583 // ORD
    
    func testGetDestinationSucceeds() {
        let destinationID = Self.validTransientDestinationID
        
        self.stub(.get(DestinationsGetSingleRequest.route(destinationID)),
                  with: .apiMockFile("Destinations/get_destinations_\(destinationID).json"))
        
        self.getDestination(id: destinationID)
    }
}
