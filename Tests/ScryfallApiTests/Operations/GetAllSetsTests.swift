/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class GetAllSetsTests: XCTestCase {
    func test_urlRequest() throws {
        let operation = ScryfallApi.GetAllSets()
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/sets", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
