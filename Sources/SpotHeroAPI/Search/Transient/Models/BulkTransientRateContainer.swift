// Copyright © 2023 SpotHero, Inc. All rights reserved.

public struct BulkTransientRateContainer: Codable {
    /// Availability of a given parking facility.
    public let availability: Availability

    /// Listing of available rates at a given parking facility.
    public let rates: [TransientRateContainer]
}
