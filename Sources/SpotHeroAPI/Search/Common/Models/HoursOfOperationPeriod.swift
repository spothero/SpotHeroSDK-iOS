// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// An operating period for a facility.
public struct HoursOfOperationPeriod: Codable {
    private enum CodingKeys: String, CodingKey {
        case endTime = "end_time"
        case hoursType = "hours_type"
        case firstDay = "first_day"
        case lastDay = "last_day"
        case startTime = "start_time"
    }
    
    /// The first day of week for this period, formatted as a three-letter abbreviation for the day.
    public let firstDay: DayOfWeek
    
    /// The start time for this period, formatted for display.
    public let startTime: String
    
    /// The end time for this period, formatted for display.
    public let endTime: String
    
    /// The last day of week for this period, formatted as a three-letter abbreviation for the day.
    public let lastDay: DayOfWeek
    
    /// The type of hours that this period represents.
    public let hoursType: HoursType
}

public extension HoursOfOperationPeriod {
    /// Represents a day of the week.
    enum DayOfWeek: String, Codable {
        case sunday = "Sun"
        case monday = "Mon"
        case tuesday = "Tue"
        case wednesday = "Wed"
        case thursday = "Thu"
        case friday = "Fri"
        case saturday = "Sat"
    }
    
    enum HoursType: String, Codable {
        case closed
        case open
    }
}
