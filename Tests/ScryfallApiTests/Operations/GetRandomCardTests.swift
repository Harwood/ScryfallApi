/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class GetRandomCardTests: XCTestCase {
    func test_urlRequest_filter() throws {
        let operation = ScryfallApi.GetRandomCard()
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/random", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_filterIsEmpty() throws {
        let operation = ScryfallApi.GetRandomCard(filter: "")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/random", query: "?q=")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_filterIsNil() throws {
        let operation = ScryfallApi.GetRandomCard(filter: "llanow el")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/random", query: "?q=llanow%20el")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
