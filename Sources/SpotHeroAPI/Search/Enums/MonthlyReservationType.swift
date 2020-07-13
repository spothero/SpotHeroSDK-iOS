// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// The category for what kind of monthly reservation this rate applies to.
public enum MonthlyReservationType: String, Codable {
    /// Parking is available 24/7.
    case twentyFourSeven = "247"
    
    /// Parking is only available during the day.
    case daytimeOnly = "daytime_only"
    
    /// Parking is available during the day on weekdays and 24/8 on weekends.
    case daytimeAndTwentyFourSevenWeekend = "daytime_and_247_weekend"
    
    /// Parking is only available overnight.
    case nightsOnly = "nights_only"
    
    /// Parking is available overnight on weekdays and 24/7 on weekends.
    case nightsAndTwentyFourSevenWeekend = "nights_and_247_weekend"
    
    /// The reservation is for storage of the vehicle (limited in/out privileges).
    case storage
    
    /// The reservation includes curbside pickup/dropoff.
    case valet
}
