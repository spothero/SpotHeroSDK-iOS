// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

protocol SearchTracking: Encodable {
    /// An identifier that represents each discrete action a user takes when interacting with a given search.
    /// If a user pans, zooms, or paginates through a list of spots, a new action ID should be issued.
    var actionID: String? { get }

    /// An identifier that represents a user across various analytics services. (eg. Segment, MixPanel, Optimizely, etc.)
    var analyticsID: String? { get }

    /// An identifier that represents each distinct search a user performs for parking.
    /// If a user changes the search text, timeframe, amenities, parking type, or any other value, a new search ID should be issued.
    var searchID: String? { get }

    /// An identifier that represents a user's current session within an application or device. Does not follow a user across devices.
    var sessionID: String? { get }
}

public struct SearchTrackingParameters: SearchTracking {
    var actionID: String?
    var analyticsID: String?
    var searchID: String?
    var sessionID: String?
}