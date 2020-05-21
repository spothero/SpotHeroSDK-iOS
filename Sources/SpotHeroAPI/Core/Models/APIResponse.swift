// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

/// The generic structure of an API response that returns a single Decodable object
///
/// Basic Response Structure:
/// ```json
/// {
///   "notifications": [],
///   "meta": {},
///   "data": {
///     ...
///   }
/// }
/// ```
///
/// Array Response Structure:
/// ```json
/// {
///   "notifications": [],
///   "meta": {},
///   "data": {
///     "results": [
///       ...
///     ]
///   }
/// }
/// ```
///
/// Error Response Structure:
/// ```json
/// {
///   "notifications": [],
///   "meta": {},
///   "data": {
///     "errors": [
///       ...
///     ]
///   }
/// }
/// ```
///
/// Note: The `notifications` key is unused.
struct APIResponse<T: Decodable>: Decodable {
    enum CodingKeys: String, CodingKey {
        case data
        case meta
    }
    
    let data: T
    let meta: APIMetadata?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.meta = try values.decodeIfPresent(APIMetadata.self, forKey: .meta)
        
        do {
            // Attempt to deserialize the decodable value from the data key directly.
            // This will work in all expected instances except for Arrays and Errors (see documentation on this class).
            self.data = try values.decode(T.self, forKey: .data)
        } catch DecodingError.typeMismatch {
            // If decoding in place failed due to a type mismatch, our next step is to test if array deserialization is possible.
            // As documented above, our arrays are returned within a data object on the "results" property.
            let nestedList = try values.decode(NestedResultsArray<T>.self, forKey: .data)
            
            // Assuming this decoded properly, we have our array and can set the value for this object.
            self.data = nestedList.results
        } catch {
            throw error
        }
    }
}

// A simple struct representing a nested object containing an Array.
private struct NestedResultsArray<T: Decodable>: Decodable {
    let results: T
}
