// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents the cancellation requirements of a reservation.
public struct CancellationRequirements: Codable {
    private enum CodingKeys: String, CodingKey {
        case noticeRequired = "required"
        case noticeDays = "period"
    }
    
    /// Whether advance notice is required.
    public let noticeRequired: Bool
    
    /// Number of days of advance notice required.
    public let noticeDays: Int
}
