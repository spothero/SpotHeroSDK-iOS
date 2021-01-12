// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// An operating period for a facility.
public struct HoursOfOperationPeriod: Codable {
    private enum CodingKeys: String, CodingKey {
        case dayOfWeek = "day_of_week"
        case endTimeSeconds = "end_time_secs"
        case startTimeSeconds = "start_time_secs"
    }
    
    /// The day of week for this period.
    public let dayOfWeek: DayOfWeek
    
    /// Start time in seconds since midnight (inclusive).
    public let startTimeSeconds: Int
    
    /// End time in seconds since midnight (exclusive).
    public let endTimeSeconds: Int
}
