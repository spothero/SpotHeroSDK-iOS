// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// An operating period for a facility.
public struct HoursOfOperationPeriod: Codable {
    private enum CodingKeys: String, CodingKey {
        case dayOfWeek = "day_of_week"
        case startTimeSeconds = "start_time_secs"
        case endTimeSeconds = "end_time_secs"
    }
    
    /// The day of week for this period.
    let dayOfWeek: DayOfWeek
    
    /// Start time in seconds since midnight (inclusive).
    let startTimeSeconds: Int
    
    /// End time in seconds since midnight (exclusive).
    let endTimeSeconds: Int
}
