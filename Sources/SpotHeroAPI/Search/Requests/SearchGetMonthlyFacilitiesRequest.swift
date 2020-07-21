// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

public struct SearchGetMonthlyFacilitiesRequest: RequestDefining {
    public typealias ResponseModel = MonthlyFacilitiesSearchResponse
    
    private enum ParameterKeys: String {
        case latitude = "lat"
        case longitude = "lon"
        case startDate = "starts"
        case maxDistanceMeters = "max_distance_meters"
        case pageSize = "page_size"
    }
    
    static let method: HTTPMethod = .get
    static let route = "/v2/search/monthly"
    
    let client: NetworkClient
    
    init(client: NetworkClient) {
        self.client = client
    }
    
    @discardableResult
    func callAsFunction(latitude: Double, longitude: Double, completion: @escaping RequestCompletion<ResponseModel>) -> URLSessionTask? {
        let parameters: [String: Any] = [
            ParameterKeys.latitude.rawValue: latitude,
            ParameterKeys.longitude.rawValue: longitude,
            ParameterKeys.startDate.rawValue =,
        ]
        
        return self.client.request(
            Self.self,
            parameters: parameters,
            completion: completion
        )
    }
}
