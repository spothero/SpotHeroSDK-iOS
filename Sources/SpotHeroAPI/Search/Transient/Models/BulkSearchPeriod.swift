// Copyright © 2021 SpotHero, Inc. All rights reserved.

import Foundation

public struct BulkSearchPeriod: Codable {
    private enum CodingKeys: String, CodingKey {
        case startDate = "starts"
        case endDate = "ends"
    }

    /// Start datetime from which results will be generated. Supported formats are RFC3339 and YYYY-MM-DDTHH:MM:SS.
    /// If a time zone is not specified, the time will be localized to each generated facility's location.
    /// If this parameter is not provided, results will be generated from the time at which the request was received.
    public let startDate: Date?

    /// End datetime from which results will be generated. Supported formats are RFC3339 and YYYY-MM-DDTHH:MM:SS.
    /// If a time zone is not specified, the time will be localized to each generated facility's location.
    /// If this parameter is not provided, results will be generated for 3 hours after the start time.
    public let endDate: Date?

    /// Initializes a new period with a given start and end date
    /// - Parameters:
    ///   - startDate: The start date.
    ///   - endDate: The end date.
    public init(startDate: Date?, endDate: Date?) {
        self.startDate = startDate
        self.endDate = endDate
    }
}
