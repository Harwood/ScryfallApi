/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class GetAllCardSymbolsTests: XCTestCase {
    func test_urlRequest() throws {
        let operation = ScryfallApi.GetAllCardSymbols()
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/symbology", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
