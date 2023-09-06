// Copyright © 2023 SpotHero, Inc. All rights reserved.

public struct BulkTransientFacilitiesSearchResponse: Codable {
    /// The list of fetched facility results.
    public let results: [BulkTransientFacilityResult]
}
