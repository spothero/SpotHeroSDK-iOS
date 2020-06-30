// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Representation of a displayable image.
public struct Image: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case url
    }
    
    /// ID which uniquely identifies an image; an opaque string.
    public let id: String
    
    /// URL from which image can be loaded.
    public let url: String
}
