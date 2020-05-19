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
    /// Returns a `URLSessionTask`, which allows for cancellation and retries.
    /// - Parameter url: The URL for the request. Accepts a URL or a String.
    /// - Parameter method: The HTTP method for the request.
    /// - Parameter parameters: The dictionary of parameters to send in the query string or HTTP body.
    /// - Parameter headers: The HTTP headers to be with the request.
    /// - Parameter encoding: The parameter encoding method. If nil, uses default for HTTP method.
    /// - Parameter completion: The completion block to call when the request is completed.
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
}
