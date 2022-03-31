// Copyright © 2022 SpotHero, Inc. All rights reserved.

import Foundation

/// A model representing availability of a given parking facility.
public struct Availability: Codable {
    /// The boolean that informs us whether the spot is available
    public let available: Bool?
}
