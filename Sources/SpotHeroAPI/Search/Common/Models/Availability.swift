// Copyright © 2023 SpotHero, Inc. All rights reserved.

import Foundation

/// A model representing availability of a given parking facility.
public struct Availability: Codable {
    private enum CodingKeys: String, CodingKey {
        case available
        case availableSpaces = "available_spaces"
    }

    /// The boolean that informs us whether the spot is available
    public let available: Bool

    /// The number of available spots in the facility or nil
    public let availableSpaces: Int?
}
