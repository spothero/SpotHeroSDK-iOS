// Copyright © 2023 SpotHero, Inc. All rights reserved.

@testable import SpotHeroAPINext
import UtilityBeltNetworking
import XCTest

class MockInterceptor: RequestInterceptor {
    func adapt(_ request: URLRequest,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        completion(.success(request))
    }

    func retry(_ request: Request,
               dueTo error: Error,
               data: Data?,
               completion: @escaping (Bool) -> Void) {
        completion(request.retryCount < 1)
    }
}
