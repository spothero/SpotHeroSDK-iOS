// Copyright © 2023 SpotHero, Inc. All rights reserved.

public struct BulkTransientFacilityResult: Codable {
    private enum CodingKeys: String, CodingKey {
        case averagePrice = "average_price"
        case bulkRates = "bulk_rates"
        case distance
        case facility
        case options
    }

    /// The average price of the rates.
    public let averagePrice: Currency

    /// Listing of available rates at a given parking facility.
    public let bulkRates: [BulkTransientRateContainer]

    /// Distance calculations between the facility and the search origin.
    public let distance: Distance?

    /// Representation of a Facility.
    public let facility: TransientFacility

    /// Contains information about misc options available to the user
    /// at a given parking facility based on search criteria and user information.
    public let options: FacilityOptions
}
