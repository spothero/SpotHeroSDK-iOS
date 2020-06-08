// Copyright © 2020 SpotHero, Inc. All rights reserved.

/// Products offered at this facility.
public struct FacilityProduct: Codable {
    /// The type of product a facility is offering.
    public let type: FacilityProductType
    
    /// Long-form description of product.
    public let description: String
}
