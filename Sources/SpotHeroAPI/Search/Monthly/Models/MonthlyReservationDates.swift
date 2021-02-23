// Copyright © 2021 SpotHero, Inc. All rights reserved.

import Foundation

/// Represents a pair of start/end dates.
public struct MonthlyReservationDates: Codable {
    private enum CodingKeys: String, CodingKey {
        case startDateFormatted = "starts_pretty"
        case starts
        case endDateFormatted = "ends_pretty"
        case ends
    }
    
    /// The date that a reservation starts.
    /// Formatted as an ISO-8601 (RFC 3339) datetime in the 'yyyy-MM-dd' format.
    public let starts: Date
    
    /// The date the reservation's first month can start in 'Month Day+Suffix' format (e.g. "January 1st").
    public let startDateFormatted: String
    
    /// The date that a reservation ends.
    /// Formatted as an ISO-8601 (RFC 3339) datetime in the 'yyyy-MM-dd' format.
    public let ends: Date
    
    /// The date the reservation's first month can end in 'Month Day+Suffix' format (e.g. "January 31st").
    public let endDateFormatted: String
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.starts = try container.decodeDateOnly(forKey: .starts)
        self.ends = try container.decodeDateOnly(forKey: .ends)
        
        self.startDateFormatted = try container.decode(String.self, forKey: .startDateFormatted)
        self.endDateFormatted = try container.decode(String.self, forKey: .startDateFormatted)
    }
}
