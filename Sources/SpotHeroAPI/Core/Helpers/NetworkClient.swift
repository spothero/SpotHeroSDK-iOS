// Copyright © 2022 SpotHero, Inc. All rights reserved.

import Foundation
import UtilityBeltNetworking
import SpotHeroAPI

/// Represents the completion block for a SpotHero API request.
public typealias RequestCompletion<T: Decodable> = (Result<T, Error>) -> Void

class NetworkClient {
    // MARK: Properties
    
    private let baseURL: URLConvertible
    private let httpClient: HTTPClient
    private let buildNumber: Int?
    
    // MARK: Methods
    
    /// Creates a new instance of `NetworkClient`.
    /// - Parameters:
    ///   - baseURL: The base URL for all API requests.
    ///   - httpClient: An `HTTPClient` through which requests will be routed. Defaults to `.shared`.
    init(baseURL: URLConvertible, httpClient: HTTPClient = .shared, buildNumber: Int? = nil) {
        self.baseURL = baseURL
        self.httpClient = httpClient
        self.buildNumber = buildNumber
    }
    
    /// Creates and sends a request which fetches raw data from an endpoint and decodes it.
    /// Returns a `URLSessionTask`, which allows for cancellation and retries.
    /// - Parameter url: The URL for the request. Accepts a URL or a String.
    /// - Parameter method: The HTTP method for the request. Defaults to `GET`.
    /// - Parameter parameters: The parameters to be converted into a String-keyed dictionary to send in the query string or HTTP body.
    /// - Parameter headers: The HTTP headers to send with the request.
    /// - Parameter encoding: The parameter encoding method. If nil, uses the default encoding for the provided HTTP method.
    /// - Parameter decoder: The `JSONDecoder` to use when decoding the response data.
    /// - Parameter completion: The completion block to call when the request is completed.
    /// - Returns: The configured `Request` object that is performed upon execution of this method.
    @discardableResult
    private func request<T: Decodable>(url: URLConvertible,
                                       method: HTTPMethod,
                                       parameters: ParameterDictionaryConvertible? = nil,
                                       headers: HTTPHeaderDictionaryConvertible? = nil,
                                       encoding: ParameterEncoding? = nil,
                                       decoder: JSONDecoder = .spotHeroAPI,
                                       completion: RequestCompletion<T>? = nil) -> Request? {
        
        return self.httpClient.request(
            url,
            method: method,
            parameters: parameters,
            headers: updatedHeaders(buildNumber: self.buildNumber, headers: headers),
            encoding: encoding,
            decoder: decoder
        ) { (response: DataResponse<T, Error>) in
            switch response.result {
            case let .success(output):
                completion?(.success(output))
            case let .failure(error):
                completion?(.failure(error))
            }
        }
    }
    
    /// Creates and sends a request which fetches raw data from an endpoint and decodes it.
    /// Returns a `URLSessionTask`, which allows for cancellation and retries.
    /// - Parameter route: The URL path for the request. Accepts a URL or a String.
    /// - Parameter method: The HTTP method for the request. Defaults to `GET`.
    /// - Parameter parameters: The parameters to be converted into a String-keyed dictionary to send in the query string or HTTP body.
    /// - Parameter headers: The HTTP headers to send with the request.
    /// - Parameter encoding: The parameter encoding method. If nil, uses the default encoding for the provided HTTP method.
    /// - Parameter decoder: The `JSONDecoder` to use when decoding the response data.
    /// - Parameter completion: The completion block to call when the request is completed.
    /// - Returns: The configured `Request` object that is performed upon execution of this method.
    @discardableResult
    func request<T: Decodable>(route: URLConvertible,
                               method: HTTPMethod,
                               parameters: ParameterDictionaryConvertible? = nil,
                               headers: HTTPHeaderDictionaryConvertible? = nil,
                               encoding: ParameterEncoding? = nil,
                               decoder: JSONDecoder = .spotHeroAPI,
                               completion: RequestCompletion<T>? = nil) -> Request? {
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

// MARK: - Convenience Methods

extension NetworkClient {
    @discardableResult
    func request<T: RequestDefining>(_ request: T.Type,
                                     parameters: ParameterDictionaryConvertible? = nil,
                                     headers: HTTPHeaderDictionaryConvertible? = nil,
                                     encoding: ParameterEncoding? = nil,
                                     decoder: JSONDecoder = .spotHeroAPI,
                                     completion: RequestCompletion<T.ResponseModel>? = nil) -> Request? where T.Route == String {
        return self.request(route: T.route,
                            method: T.method,
                            parameters: parameters,
                            headers: headers,
                            encoding: encoding,
                            decoder: decoder,
                            completion: completion)
    }
    
    @discardableResult
    func request<T: RequestDefining>(_ request: T.Type,
                                     parameters: ParameterDictionaryConvertible? = nil,
                                     headers: HTTPHeaderDictionaryConvertible? = nil,
                                     encoding: ParameterEncoding? = nil,
                                     decoder: JSONDecoder = .spotHeroAPI,
                                     completion: RequestCompletion<T.ResponseModel>? = nil) -> Request? where T.Route == URLConvertible {
        return self.request(route: T.route,
                            method: T.method,
                            parameters: parameters,
                            headers: headers,
                            encoding: encoding,
                            decoder: decoder,
                            completion: completion)
    }
}

extension NetworkClient {
    private func updatedHeaders(buildNumber: Int? = nil, headers: HTTPHeaderDictionaryConvertible? = nil) -> HTTPHeaderDictionaryConvertible? {
        if let buildNumber = self.buildNumber, headers == nil {
            return [APIHeaders.HTTPHeaderField.userAgent.rawValue: "ios-native-build-\(buildNumber)"]
        }
        return nil
    }
}
