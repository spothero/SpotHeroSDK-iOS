// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

public final class DestinationsEndpoint: Endpoint {
    @discardableResult
    public func get(id destinationID: Int) -> DestinationsGetByIDRequest {
        return DestinationsGetByIDRequest(client: self.client, destinationID: destinationID)
    }
}
