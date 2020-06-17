// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Representation of a displayable image.
public struct Image: Codable {
    /// ID which uniquely identifies an image; an opaque string.
    public let id: String
    
    /// URL from which image can be loaded.
    public let url: String
    
    /// Caption associated with the image.
    public let caption: String
}
