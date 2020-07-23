// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents facility information only applicable within the transient context.
public struct TransientFacilityAttributes: Codable {
    /// Information concerning the redemption process for customers who park at a facility.
    public let redemption: Redemption<[RedemptionInstruction]>
}
