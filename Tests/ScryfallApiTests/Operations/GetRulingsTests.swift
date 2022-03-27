/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class GetRulingsTests: XCTestCase {
    func test_urlRequest_scryfallID() throws {
        let uuid = UUID()
        let operation = ScryfallApi.GetRulings(identifier: .scryfall(uuid))
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/\(uuid.uuidString)/rulings", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_arenaID() throws {
        let operation = ScryfallApi.GetRulings(identifier: .arena(123))
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/arena/123/rulings", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_mtgoID() throws {
        let operation = ScryfallApi.GetRulings(identifier: .mtgo(456))
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/mtgo/456/rulings", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_multiverseID() throws {
        let operation = ScryfallApi.GetRulings(identifier: .multiverse(789))
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/multiverse/789/rulings", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_setCode_collectorNumber() throws {
        let operation = ScryfallApi.GetRulings(setCode: "abc", collectorNumber: "123")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/abc/123/rulings", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
