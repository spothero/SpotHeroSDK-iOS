// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// A value which uniquely distinguishes a type of amenity at a parking spot.
public enum AmenityType: String, Codable {
    case shuttle
    case inOut = "in-out"
    case selfPark = "self-park"
    case valet
    case electricVehicle = "ev"
    case accessible
    case attendant
    case covered
    case paved
    case oneTap = "one-tap"
    case heated
}
