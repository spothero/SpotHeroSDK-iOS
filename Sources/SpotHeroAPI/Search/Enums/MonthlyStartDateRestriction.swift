// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// This shows what day of the month that billing will start.
public enum MonthlyStartDateRestriction: String, Codable {
    /// Billing can only start on the 1st of the month.
    case firstOnly = "1st_only"
    
    /// Billing may start on the 1st or 15th of the month.
    case firstOrFifteenth = "1st_or_15th"
    
    /// There are no restrictions on when billing can start.
    case none
}
