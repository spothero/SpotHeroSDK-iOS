// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents when a facility is open for business.
public struct HoursOfOperation: Codable {
    private enum CodingKeys: String, CodingKey {
        case periods
        case text
        case alwaysOpen = "always_open"
    }
    
    /// List of operating periods for the facility.
    public let periods: [HoursOfOperationPeriod]
    
    /// Human-readable summarization of a facility's hours of operation.
    public let text: String
    
    /// Whether facility is always open (i.e., never closes); if true, overrides
    /// all other attributes, in which case all other attributes will be defined as null.
    public let alwaysOpen: Bool
}
