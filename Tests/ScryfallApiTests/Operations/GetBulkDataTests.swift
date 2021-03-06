/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class GetBulkDataTests: XCTestCase {
    func test_urlRequest_id() throws {
        let uuid = UUID()
        let operation = ScryfallApi.GetBulkData(id: uuid)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/bulk-data/\(uuid.uuidString)", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_type() throws {
        let operation = ScryfallApi.GetBulkData(type: "abc")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/bulk-data/abc", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
