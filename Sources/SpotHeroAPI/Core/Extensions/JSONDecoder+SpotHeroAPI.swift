// Copyright © 2021 SpotHero, Inc. All rights reserved.

import Foundation

public extension JSONDecoder {
    /// A custom `JSONDecoder` with decoding strategies that match the SpotHero API.
    static var spotHeroAPI: JSONDecoder {
        let decoder = JSONDecoder()
        
        /// SpotHero uses ISO8601 date strings universally.
        decoder.dateDecodingStrategy = .iso8601
        
        /*
         While SpotHero uses snake_case for all keys in across all services and endpoints,
         unfortunately, we can't use the .convertFromSnakeCase KeyDecodingStrategy.
         
         The way the key coding strategy works is that it parses incoming keys. As such,
         this rule will convert the JSON dictionary keys from snake_case to camelCase before decoding.
         
         This leaves us without a way to define custom keys as the raw value.
         
         Example:
         
         enum CodingKeys: String, CodingKey {
            case identifier = "my_identifier"
         }
         
         In this example, if we had an incoming key called "my_identifier", it would be converted into "myIdentifier" first,
         therefore the proper way to list the coding key override is like so:
         
         enum CodingKeys: String, CodingKey {
            case identifier = "myIdentifier"
         }
         
         This creates a transition from "my_identifier" -> "myIdentifier" -> "identifier", which adds a confusing step.
         Instead, we will continue to keep the default decoding strategy and explicitly define keys.
         
         */
        
        return decoder
    }
}
