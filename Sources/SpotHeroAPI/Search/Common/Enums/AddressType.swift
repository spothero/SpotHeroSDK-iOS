// Copyright © 2022 SpotHero, Inc. All rights reserved.

/// Defines the purpose of the address/entrance at the facility.
public enum AddressType: String, Codable {
    /// The vehicle entrance to be used for navigation and on the parking pass.
    case defaultVehicleEntrance = "default_vehicle_entrance"
    /// The address recognized by the facility owner.
    case physical
    /// The location of the facility as it should appear in searches.
    case search
    /// One of potentially several vehicle entrances at the facility.
    case vehicleEntrance = "vehicle_entrance"
    /// The location of the facility for walking distance calculations.
    case walkingDistance = "walking_distance"
}
