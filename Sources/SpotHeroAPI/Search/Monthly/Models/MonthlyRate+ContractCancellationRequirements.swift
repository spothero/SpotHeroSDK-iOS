// Copyright © 2020 SpotHero, Inc. All rights reserved.

public extension MonthlyRate {
    /// Represents the cancellation requirements of a reservation.
    struct ContractCancellationRequirements: Codable {
        private enum CodingKeys: String, CodingKey {
            case noticeRequired = "notice_required"
            case noticeDays = "notice_days"
        }
        
        /// Whether advance notice is required.
        public let noticeRequired: Bool
        
        /// Number of days of advance notice required.
        public let noticeDays: Int
    }
}
