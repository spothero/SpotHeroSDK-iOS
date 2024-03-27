// Copyright © 2024 SpotHero, Inc. All rights reserved.

import Foundation

public struct OversizeVehicleFeeInformation: Codable {
    private enum CodingKeys: String, CodingKey {
        case onsiteFee = "onsite_fee"
        case oversizeType = "oversize_type"
        case oversizePolicyId = "oversize_policy_id"
        case unknownOnsiteFee = "unknown_onsite_fee"
    }

    public enum OversizeType: String, Codable {
        case oversize
        case unknown

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let value = try? container.decode(String.self)
            self = value.flatMap { .init(rawValue: $0) } ?? .unknown
        }
    }
    
    /// Contains information about the fee that the customer will have to pay on site if their vehicle is considered oversize.
    public let onsiteFee: Currency?

    /// The type of oversize fee. Right now the only value will be oversize.
    public let oversizeType: OversizeType
    
    /// Can be safely ignored. This is for internal audit only.
    public let oversizePolicyId: Int

    /// A boolean value indicating whether the `onsite_fee` is unknown or not.
    public let unknownOnsiteFee: Bool
}
