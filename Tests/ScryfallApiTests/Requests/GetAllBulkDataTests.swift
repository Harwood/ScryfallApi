/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class GetAllBulkDataTests: XCTestCase {
    func test_urlRequest() throws {
        let request = ScryfallApi.GetAllBulkData()
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/bulk-data", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
