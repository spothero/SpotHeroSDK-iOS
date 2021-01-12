// Copyright © 2021 SpotHero, Inc. All rights reserved.

import Foundation

extension TimeZone {
    enum ParseError: Error, LocalizedError {
        case invalidAbbreviation(String)
        case invalidIdentifier(String)
        
        var errorDescription: String? {
            switch self {
            case let .invalidAbbreviation(abbreviation):
                return "Invalid timezone abbreviation '\(abbreviation)'."
            case let .invalidIdentifier(identifier):
                return "Invalid timezone identifier '\(identifier)'."
            }
        }
    }
    
    static func safelyUnwrapped(fromIdentifier identifier: String) throws -> TimeZone {
        guard let timeZone = TimeZone(identifier: identifier) else {
            throw ParseError.invalidIdentifier(identifier)
        }
        
        return timeZone
    }
    
    static func safelyUnwrapped(fromAbbreviation abbreviation: String) throws -> TimeZone {
        guard let timeZone = TimeZone(abbreviation: abbreviation) else {
            throw ParseError.invalidAbbreviation(abbreviation)
        }
        
        return timeZone
    }
}
