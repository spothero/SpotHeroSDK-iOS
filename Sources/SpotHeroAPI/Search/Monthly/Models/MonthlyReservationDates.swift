// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

/// Represents a pair of start/end dates.
public struct MonthlyReservationDates: Codable {
    /// The date that a reservation starts.
    /// Formatted as an ISO-8601 (RFC 3339) datetime in the 'yyyy-MM-dd' format.
    public let starts: Date
    
    /// The date that a reservation ends.
    /// Formatted as an ISO-8601 (RFC 3339) datetime in the 'yyyy-MM-dd' format.
    public let ends: Date
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.starts = try container.decodeDateOnly(forKey: .starts)
        self.ends = try container.decodeDateOnly(forKey: .ends)
    }
}
