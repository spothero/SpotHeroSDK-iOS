// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Represents when a facility is open for business.
public struct HoursOfOperation: Codable {
    private enum CodingKeys: String, CodingKey {
        case alwaysOpen = "always_open"
        case periods
        case text
    }
    
    /// List of operating periods for the facility.
    public let periods: [HoursOfOperationPeriod]
    
    /// Contains a set of messages to be displayed alongside hours of operation.
    public let text: [String]
    
    /// Whether facility is always open (i.e., never closes).
    /// If true, the list of periods will be empty.
    public let alwaysOpen: Bool
}
