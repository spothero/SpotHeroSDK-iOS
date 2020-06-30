// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Represents a redemption instruction.
public struct RedemptionInstruction: Codable {
    /// ID which uniquely identifies a redemption instruction; an opaque string.
    public let id: String
    
    /// Representation of a displayable image.
    public let illustration: Image
    
    /// Body of the redemption instructions.
    public let text: String
}
