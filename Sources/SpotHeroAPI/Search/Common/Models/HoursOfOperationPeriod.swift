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
    public let firstDay: String
    
    /// The start time for this period, formatted for display.
    public let startTime: String
    
    /// The end time for this period, formatted for display.
    public let endTime: String
    
    /// The last day of week for this period, formatted as a three-letter abbreviation for the day.
    public let lastDay: String
    
    // TODO: IOS-2797 - Add link to API documentation showing possible enum values for this property.
    /// The type of hours that this period represents.
    /// At the time of writing, the possible values are "open" or "closed".
    public let hoursType: String
}
