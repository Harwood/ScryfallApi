/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class GetAllBulkDataTests: XCTestCase {
    func test_urlRequest() throws {
        let operation = ScryfallApi.GetAllBulkData()
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/bulk-data", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
