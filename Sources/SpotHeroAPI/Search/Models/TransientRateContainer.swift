// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents an available rate at a given parking facility.
public struct TransientRateContainer: Codable {
    /// Transient-specific metadata pertaining to a rate for the rental of a parking spot.
    /// Currently empty but exists for forwards-compatibility.
    public let transient: TransientRate
    
    /// A quote for parking provided by SpotHero to a prospective renter.
    /// This quote is generated by SpotHero, includes detailed pricing information,
    /// and is guaranteed to be honored for the period of validity specified within
    /// so long as no part of the originally issued quote has been modified.
    public let quote: Quote
}
