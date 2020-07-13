// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Describes the exit and re-entry privileges.
public struct InOutPrivileges: Codable {
    private enum CodingKeys: String, CodingKey {
        case allowed
        case fee
        case limit
        case limitUnit = "limit_unit"
    }
    
    /// The unit that determines the rate limit for leaving during the stay.
    public enum LimitUnit: String, Codable {
        case day
        case week
        case month
    }
    
    /// Whether or not the parker is allowed to leave and come back during the stay.
    public let allowed: Bool
    
    /// The fee charged for each exit and entry. If there is no fee, the value will be 0.
    public let fee: Currency
    
    /// How many times the renter can leave during the stay within the given limit unit. Null indicates that there is no limit.
    public let limit: Int?
    
    // WIP: Needs Better Docs
    /// The unit that determines the rate limit for leaving during the stay.
    public let limitUnit: LimitUnit
}
