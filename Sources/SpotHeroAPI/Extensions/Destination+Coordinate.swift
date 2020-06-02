// Copyright © 2020 SpotHero, Inc. All rights reserved.

import CoreLocation

public extension Destination {
    /// The coordinate based on the lat/long
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude,
                                      longitude: self.longitude)
    }
}
