// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Represents a day of the week.
public enum DayOfWeek: String, Codable {
    #warning("We are changing this to: Sun, Mon, Tue, Wed, Thu, Fri, Sat.")
    case sunday = "Sun"
    case monday = "Mon"
    case tuesday = "Tue"
    case wednesday = "Wed"
    case thursday = "Thu"
    case friday = "Fri"
    case saturday = "Sat"
}
