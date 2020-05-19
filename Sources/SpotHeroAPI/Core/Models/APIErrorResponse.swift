// Copyright © 2020 SpotHero, Inc. All rights reserved.

import Foundation

typealias APIErrorResponse = APIResponse<APIErrorArray>

/// The generic inner structure ("data" portion) of an API response that returns an array of errors
struct APIErrorArray: Decodable {
    let errors: [ServerError]
}

struct ServerError: Decodable {
    let code: String
    let messages: [String]
}
