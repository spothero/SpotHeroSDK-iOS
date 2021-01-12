// Copyright © 2021 SpotHero, Inc. All rights reserved.

import Foundation

/// Wrapper class for call metadata returned from the API
struct APIMetadata: Decodable {
    /// [optional] The total count of objects which would be returned by this request if it wasn't paginated. Nil if not returned by the API.
    let count: Int?
    
    /// [optional] The next page of results for this request, as a fully qualified URL string. Nil if no next page exists.
    let next: String?
    
    /// [optional] The previous page of results for this request, as a fully qualified URL string. Nil if no previous page exists.
    let previous: String?
    
    // MARK: - Computed vars
    
    /// [optional] The integer page number of the next page, or nil if either no next page exists or it cannot be parsed from the URL string.
    var nextPage: Int? {
        return self.pageNumber(fromURLString: self.next)
    }
    
    /// [optional] The integer page number of the previous page, or nil if either no previous page exists or it cannot be parsed from the URL string.
    var previousPage: Int? {
        return self.pageNumber(fromURLString: self.previous)
    }
    
    // MARK: JSON Keys
    
    private enum JSONKey: String, CodingKey {
        case count
        case next
        case previous
    }
    
    // MARK: Non-JSON init
    
    init(count: Int? = nil,
         next: String? = nil,
         previous: String? = nil) {
        self.count = count
        self.next = next
        self.previous = previous
    }
    
    // MARK: Helper methods
    
    private func pageNumber(fromURLString: String?) -> Int? {
        guard let urlString = fromURLString else {
            // Nothing to parse, no next page.
            return nil
        }
        
        guard
            let components = URLComponents(string: urlString),
            let queryItems = components.queryItems,
            let pageQueryItem = queryItems.first(where: { $0.name == "page" }),
            let pageValue = pageQueryItem.value,
            let pageNumber = Int(pageValue) else {
            // Couldn't actually parse the page number out of the URL string returned
            return nil
        }
        
        return pageNumber
    }
}
