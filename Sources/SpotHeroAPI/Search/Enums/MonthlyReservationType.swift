// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// The category for what kind of monthly reservation this rate applies to.
public enum MonthlyReservationType: String, Codable {
    case twentyFourSeven = "247"
    case daytimeOnly = "daytime_only"
    case daytimeAndTwentyFourSevenWeekend = "daytime_and_247_weekend"
    case nightsOnly = "nights_only"
    case nightsAndTwentyFourSevenWeekend = "nights_and_247_weekend"
    case storage
    case valet
}
