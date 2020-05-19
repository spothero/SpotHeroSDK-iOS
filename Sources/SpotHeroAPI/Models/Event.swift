// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

/// A class representing an individual event which will be held at a specific date and time.
public final class Event: Decodable {
    // MARK: Properties
    
    /// The identifier of the related destination.
    public let destinationID: Int
    
    /// The end date of this event.
    public let endDate: Date?
    
    /// The identifier of this event.
    public let identifier: Int
    
    /// The user-facing title of this event.
    public let title: String
    
    /// The start date of this event.
    public let startDate: Date?
    
    // MARK: Enums
    
    private enum CodingKeys: String, CodingKey {
        case destinationID = "destination_id"
        case endDate = "ends"
        case identifier = "id"
        case title
        case startDate = "starts"
    }
    
    // MARK: Methods
    
    public init(identifier: Int,
                title: String,
                destinationID: Int,
                startDate: Date?,
                endDate: Date?) {
        self.identifier = identifier
        self.title = title
        self.destinationID = destinationID
        self.startDate = startDate
        self.endDate = endDate
    }
}
