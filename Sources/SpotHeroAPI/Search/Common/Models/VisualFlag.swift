// Copyright © 2024 SpotHero, Inc. All rights reserved.

import Foundation

public enum VisualFlagType: String, Codable {
    case officialParking = "official_parking"
    case shortestWalk = "shortest_walk"
    case bestValue = "best_value"
    case highestRated = "highest_rated"
    case unknown
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let stringValue = try container.decode(String.self)
        self = .init(rawValue: stringValue) ?? .unknown
    }
}

public struct VisualFlag: Codable {
    private enum CodingKeys: String, CodingKey {
        case title
        case description
        case icon
        case type
    }
    
    /// Title of the  VisualFlag.
    public let title: String
    
    /// Description of the  VisualFlag.
    public let description: String
    
    /// URL from which image can be loaded.
    public let icon: String
    
    /// The type of visual flag.
    public let type: VisualFlagType
}
