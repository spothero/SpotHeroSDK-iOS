// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

extension KeyedDecodingContainer {
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
