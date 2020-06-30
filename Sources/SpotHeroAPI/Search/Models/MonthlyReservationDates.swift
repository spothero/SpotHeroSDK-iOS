// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

/// Represents a pair of start/end dates.
public struct MonthlyReservationDates: Codable {
    /// Represents the instant at which a reservation starts.
    /// Localized in the time zone of the facility.
    /// Formatted as an ISO-8601 (RFC 3339) datetime.
    public let starts: Date
    
    /// Represents the instant at which a reservation ends.
    /// Localized in the time zone of the facility.
    /// Formatted as an ISO-8601 (RFC 3339) datetime.
    public let ends: Date
}
