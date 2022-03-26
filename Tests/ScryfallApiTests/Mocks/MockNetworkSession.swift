/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import Foundation
@testable import ScryfallApi

struct MockNetworkSession: NetworkSession {
    let data: Data
    let urlResponse: URLResponse = URLResponse()

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        (data, urlResponse)
    }
}
