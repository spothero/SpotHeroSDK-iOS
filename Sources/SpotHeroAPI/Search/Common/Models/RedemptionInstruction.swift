// Copyright © 2021 SpotHero, Inc. All rights reserved.

/// Represents a redemption instruction.
public struct RedemptionInstruction: Codable {
    /// ID which uniquely identifies a redemption instruction; an opaque string.
    public let id: String
    
    /// Representation of a displayable image.
    public let illustration: Image
    
    /// Body of the redemption instructions. This field may contain HTML content.
    public let text: String
}
