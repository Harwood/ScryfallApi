/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import Foundation
@testable import ScryfallApi

struct MockScryfallResponse: Equatable, Codable {
    let type: String
    let data: String
}

struct MockScryfallRequest: ScryfallRequest {
    typealias Response = MockScryfallResponse
    var path: String = ""
    var queryItems: [URLQueryItem] = []
    var httpMethod: HTTPMethod = .GET
}
