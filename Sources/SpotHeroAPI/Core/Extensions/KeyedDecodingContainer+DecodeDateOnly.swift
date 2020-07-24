// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

extension KeyedDecodingContainer {
    /// Decodes a `Date` object from an ISO-8601 date string in the format `yyyy-MM-dd`.
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Throws: A `DecodingError.dataCorruptedError` if the format is incorrect.
    ///           This is the same error that would be thrown if the standard `decode` function was used.
    /// - Returns: A `Date` object localized to the current device locale.
    func decodeDateOnly(forKey key: KeyedDecodingContainer<K>.Key) throws -> Date {
        let dateFormat = "yyyy-MM-dd"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        let dateString = try self.decode(String.self, forKey: key)
        
        if let date = dateFormatter.date(from: dateString) {
            return date
        } else {
            throw DecodingError.dataCorruptedError(
                forKey: key,
                in: self,
                debugDescription: "Date string does not match format '\(dateFormat)' expected by formatter."
            )
        }
    }
}
