// Copyright © 2021 SpotHero, Inc. All rights reserved.

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
    /// The facility is immediately available for parking after a monthly reservation is created.
    case immediateParking = "immediate_parking"
    /// Users may enter and exit the facility more than one time.
    case inOut = "in_out"
    /// The facility does not require a signed, long-term contract for monthly parking.
    case noContract = "no_contract"
    /// The user can open the gate with a button on their app.
    case oneTap = "one_tap"
    /// The surface of the facility is solid, such as asphalt or concrete.
    case paved
    /// Users may park their own vehicles at this facility.
    case selfPark = "self_park"
    /// The facility has a shuttle available to nearby destinations, like an airport.
    case shuttle
    /// Entering/exiting the facility does not require touching shared surfaces.
    case touchless
    /// A valet will park the user's vehicle at this facility.
    case valet
    /// The facility is wheelchair accessible.
    case wheelchairAccessible = "wheelchair_accessible"
}
