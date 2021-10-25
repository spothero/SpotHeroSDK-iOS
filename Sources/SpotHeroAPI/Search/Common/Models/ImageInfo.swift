// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Representation of a displayable image.
public struct ImageInfo: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case url
    }
    
    /// ID which uniquely identifies an image; an opaque string.
    public let id: String
    
    /// URL from which image can be loaded.
    public let url: String
}
