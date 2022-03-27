/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class ParseManaCostTests: XCTestCase {
    func test_urlRequest_manaCost() throws {
        let operation = ScryfallApi.ParseManaCost(manaCost: "8{U}{R}")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/symbology/parse-mana", query: "?cost=8%7BU%7D%7BR%7D")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_manaCostIsEmpty() throws {
        let operation = ScryfallApi.ParseManaCost(manaCost: "")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/symbology/parse-mana", query: "?cost=")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
