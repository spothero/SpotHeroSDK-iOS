// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents a restriction on the start date of the monthly reservation.
public enum MonthlyStartDateRestriction: String, Codable {
    /// Billing can only start on the 1st of the month.
    case firstOnly = "1st_only"
    
    /// Billing may start on the 1st or 15th of the month.
    case firstOrFifteenth = "1st_or_15th"
    
    /// There are no restrictions on when billing can start.
    case none
}
