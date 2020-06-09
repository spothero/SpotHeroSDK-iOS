// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// This shows what day of the month that billing will start.
public enum MonthlyStartDateRestriction: String, Codable {
    case first = "1st_only"
    case firstOrFifteenth = "1st_or_15th"
    case none
}
