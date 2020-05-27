// Copyright © 2020 SpotHero, Inc. All rights reserved.

import CoreLocation

public extension PartnerAirport {
    /// Representation of the airport's location for compatability with `CoreLocation` operations.
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude,
                                      longitude: self.longitude)
    }
}
