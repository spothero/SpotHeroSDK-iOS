// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// A value which uniquely distinguishes a type of amenity at a parking spot.
public enum AmenityType: String, Codable {
    /// The facility has staff on-site for assistance and questions.
    case attendant
    /// The facility has a roof over the vehicles.
    case covered
    /// The facility has EV charging capabilities.
    case electricVehicle = "ev"
    /// The facility is heated during cold weather.
    case heated
    /// Users may enter and exit the facility more than one time.
    case inOut = "in_out"
    /// The user can open the gate with a button on their app.
    case oneTap = "one_tap"
    /// The surface of the facility is solid, such as asphalt or concrete.
    case paved
    /// Users may park their own vehicles at this facility.
    case selfPark = "self_park"
    /// The facility has a shuttle available to nearby destinations, like an airport.
    case shuttle
    /// A valet will park the users vehicle at this facility.
    case valet
    /// The facility is wheelchair accessible.
    case wheelchairAccessible = "accessible"
}
