// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents the completion block for a SpotHero API request.
public typealias RequestCompletion<T: Decodable> = (Result<T, Error>) -> Void

class NetworkClient {
    // MARK: Properties
    
    private let baseURL: URLConvertible
    private let httpClient: HTTPClient = .shared
    
    // MARK: Methods
    
    init(baseURL: URLConvertible) {
        self.baseURL = baseURL
        
        #if DEBUG
            self.httpClient.isDebugLoggingEnabled = true
        #endif
    }
    
    /// Creates and sends a request, fetching raw data from an endpoint.
    /// - Parameters:
    ///   - route: The URL for the request. Accepts a URL or a String.
    ///   - method: The HTTP method for the request.
    ///   - parameters: The dictionary of parameters to send in the query string or HTTP body.
    ///   - headers: The HTTP headers to be with the request.
    ///   - encoding: The parameter encoding method. If nil, uses default for HTTP method.
    ///   - decoder: The decoder to use for parsing the JSON. Uses the SpotHeroAPI decoder by default.
    ///   - completion: The completion block to call when the request is completed.
    /// - Returns: Returns a `URLSessionTask`, which allows for cancellation and retries.
    @discardableResult
    func request<T: Decodable>(url: URLConvertible,
                               method: HTTPMethod,
                               parameters: [String: Any]? = nil,
                               headers: HTTPHeaderDictionaryConvertible? = nil,
                               encoding: ParameterEncoding? = nil,
                               decoder: JSONDecoder = .spotHeroAPI,
                               completion: RequestCompletion<T>? = nil) -> URLSessionTask? {
        return self.httpClient.request(
            url,
            method: method,
            parameters: parameters,
            headers: headers,
            encoding: encoding,
            decoder: decoder
        ) { (response: DataResponse<APIResponse<T>, Error>) in
            switch response.result {
            case let .success(apiResponse):
                // The apiResponse.data is NOT a Data type, it is our response object
                completion?(.success(apiResponse.data))
            case let .failure(error):
                // If failure, pass the error
                completion?(.failure(error))
            }
        }
    }
    
    @discardableResult
    func request<T: RequestDefining & SimpleRouteDefining>(_ request: T.Type,
                                                           parameters: [String: Any]? = nil,
                                                           headers: HTTPHeaderDictionaryConvertible? = nil,
                                                           encoding: ParameterEncoding? = nil,
                                                           decoder: JSONDecoder = .spotHeroAPI,
                                                           completion: RequestCompletion<T.ResponseModel>? = nil) -> URLSessionTask? {
        return self.request(route: T.route,
                            method: T.method,
                            parameters: parameters,
                            headers: headers,
                            encoding: encoding,
                            decoder: decoder,
                            completion: completion)
    }
    
    @discardableResult
    func request<T: Decodable>(route: URLConvertible,
                               method: HTTPMethod,
                               parameters: [String: Any]? = nil,
                               headers: HTTPHeaderDictionaryConvertible? = nil,
                               encoding: ParameterEncoding? = nil,
                               decoder: JSONDecoder = .spotHeroAPI,
                               completion: RequestCompletion<T>? = nil) -> URLSessionTask? {
        // Prepend the base URL to the monolith route path
        let url: URLConvertible = "\(self.baseURL)/\(route)"
            // and strip any double-slashes we find that aren't proceeded by a colon (indicating a scheme)
            .replacingOccurrences(of: #"(?<!:)/{2}"#, with: "/", options: [.regularExpression])
            // trim any trailing slash on the end of the URL
            .trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        
        return self.request(url: url,
                            method: method,
                            parameters: parameters,
                            headers: headers,
                            encoding: encoding,
                            decoder: decoder,
                            completion: completion)
    }
}
