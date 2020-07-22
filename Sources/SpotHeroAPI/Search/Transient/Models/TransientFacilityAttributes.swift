// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents facility information only applicable within the transient context.
public struct TransientFacilityAttributes: Codable {
    /// Transient parking amenities offered at the facility.
    public let amenities: [AmenityType]
    
    /// Information concerning the redemption process for customers who park at a facility.
    public let redemption: Redemption<[RedemptionInstruction]>
}
