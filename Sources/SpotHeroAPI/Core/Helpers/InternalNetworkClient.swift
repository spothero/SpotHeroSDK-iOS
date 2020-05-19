// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking

/// Represents the completion block for a SpotHero API request.
public typealias RequestCompletion<T: Decodable> = (Result<T, Error>) -> Void

class InternalNetworkClient {
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
    ///   - decoder: The decoder to use for parsing the JSON. Uses the SpotHeroAPI decoer by default.
    ///   - completion: The completion block to call when the request is completed.
    /// - Returns: Returns a `URLSessionTask`, which allows for cancellation and retries.
    @discardableResult
    func request<T>(_ url: URLConvertible,
                    method: HTTPMethod,
                    parameters: [String: Any]? = nil,
                    headers: HTTPHeaderDictionaryConvertible? = nil,
                    encoding: ParameterEncoding? = nil,
                    decoder: JSONDecoder = .spotHeroAPI,
                    completion: RequestCompletion<T>? = nil) -> URLSessionTask? where T: Decodable {
        return self.httpClient.request(
            url,
            method: method,
            parameters: parameters,
            headers: headers,
            encoding: encoding,
            decoder: decoder
        ) { (response: DataResponse<APIResponse<T>, Error>) in
            switch response.result {
            case let .success(data):
                completion?(.success(data.data))
            case let .failure(error):
                completion?(.failure(error))
            }
        }
    }
    
    /// Creates and sends a request, fetching raw data from an endpoint.
    /// Instead of a URL, it accepts a `MonolithRoute` type as a convenience overload.
    /// - Parameters:
    ///   - route: The monolith route for the request, which is converted into a URL.
    ///   - method: The HTTP method for the request.
    ///   - parameters: The dictionary of parameters to send in the query string or HTTP body.
    ///   - headers: The HTTP headers to be with the request.
    ///   - encoding: The parameter encoding method. If nil, uses default for HTTP method.
    ///   - decoder: The decoder to use for parsing the JSON. Uses the SpotHeroAPI decoer by default.
    ///   - completion: The completion block to call when the request is completed.
    /// - Returns: Returns a `URLSessionTask`, which allows for cancellation and retries.
    @discardableResult
    func request<T>(_ route: MonolithRoute,
                    method: HTTPMethod,
                    parameters: [String: Any]? = nil,
                    headers: HTTPHeaderDictionaryConvertible? = nil,
                    encoding: ParameterEncoding? = nil,
                    decoder: JSONDecoder = .spotHeroAPI,
                    completion: RequestCompletion<T>? = nil) -> URLSessionTask? where T: Decodable {
        // Prepend the base URL to the monolith route path
        let url: URLConvertible = "\(self.baseURL)/\(route.fullPath)"
            // and strip any double-slashes we find that aren't proceeded by a colon (indicating a scheme)
            .replacingOccurrences(of: #"(?<!:)/{2}"#, with: "/", options: [.regularExpression])
            // trim any trailing slash on the end of the URL
            .trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        
        return self.request(url,
                            method: method,
                            parameters: parameters,
                            headers: headers,
                            encoding: encoding,
                            decoder: decoder,
                            completion: completion)
    }
}
