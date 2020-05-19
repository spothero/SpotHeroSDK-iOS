// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

public extension JSONDecoder {
    /// A custom `JSONDecoder` with decoding strategies that match the SpotHero API.
    static var spotHeroAPI: JSONDecoder {
        let decoder = JSONDecoder()
        
        /// SpotHero uses ISO8601 date strings universally.
        decoder.dateDecodingStrategy = .iso8601
        
        /// SpotHero uses snake_case for all keys in across all services and endpoints.
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return decoder
    }
}
