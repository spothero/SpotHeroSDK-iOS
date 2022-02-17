// Copyright © 2022 SpotHero, Inc. All rights reserved.

/// Defines the supported fee types at the facility.
/// The difference between a fee and a tax is when they are applied:
/// A fee is applied to the base rate, while a tax is applied
/// to the sum of the base rate and all applicable fees.
public enum FacilityFee: String, Codable {
    /// A fee applied to reservations at facilities near airports.
    case airportFee = "airport_fee"
    /// A tax applied to reservations at facilities near airports.
    case airportTax = "airport_tax"
    /// A fee applied to all reservations for facilities within a specific city.
    case blanketFee = "blanket_fee"
    /// A tax applied to all reservations for facilities within a specific city.
    case blanketTax = "blanket_tax"
    /// A fee applied to reservations for large vehicles.
    case oversizeFee = "oversize_fee"
    /// A fee applied to all reservations at a given facility.
    case facilityFee = "facility_fee"
    /// A fee applied to reservations tied to events.
    case eventFee = "event_fee"
}
