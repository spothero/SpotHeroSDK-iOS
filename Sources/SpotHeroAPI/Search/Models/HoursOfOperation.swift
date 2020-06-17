// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents when a facility is open for business.
public struct HoursOfOperation: Codable {
    private enum CodingKeys: String, CodingKey {
        case periods
        case alwaysOpen = "always_open"
    }
    
    /// List of operating periods for the facility.
    public let periods: [HoursOfOperationPeriod]
    
    /// Whether facility is always open (i.e., never closes).
    /// If true, the list of periods will be empty.
    public let alwaysOpen: Bool
}
