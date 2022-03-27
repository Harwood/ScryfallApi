/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class GetCardTests: XCTestCase {
    func test_urlRequest_scryfallID() throws {
        let uuid = UUID()
        let operation = ScryfallApi.GetCard(identifier: .scryfall(uuid))
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/\(uuid.uuidString)", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_arenaID() throws {
        let operation = ScryfallApi.GetCard(identifier: .arena(123))
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/arena/123", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_cardmarketID() throws {
        let operation = ScryfallApi.GetCard(identifier: .cardmarket(123))
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/cardmarket/123", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_mtgoID() throws {
        let operation = ScryfallApi.GetCard(identifier: .mtgo(123))
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/mtgo/123", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_multiverseID() throws {
        let operation = ScryfallApi.GetCard(identifier: .multiverse(123))
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/multiverse/123", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_tcgplayerID() throws {
        let operation = ScryfallApi.GetCard(identifier: .tcgplayer(123))
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/tcgplayer/123", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_setCode_collectorNumber_language() throws {
        let operation = ScryfallApi.GetCard(setCode: "abc", collectorNumber: "123", language: "en")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/abc/123/en", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_setCode_collectorNumber_languageIsNil() throws {
        let operation = ScryfallApi.GetCard(setCode: "abc", collectorNumber: "123")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/abc/123", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_exactName_setCode() throws {
        let operation = ScryfallApi.GetCard(exactName: "llano", setCode: "abc")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/named", query: "?exact=llano&set=abc")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_exactName_setCodeIsNil() throws {
        let operation = ScryfallApi.GetCard(exactName: "llanowar el")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/named", query: "?exact=llanowar%20el")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_fuzzyName_setCode() throws {
        let operation = ScryfallApi.GetCard(fuzzyName: "llano", setCode: "abc")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/named", query: "?fuzzy=llano&set=abc")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_fuzzyName_setCodeIsNil() throws {
        let operation = ScryfallApi.GetCard(fuzzyName: "llanowar el")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/named", query: "?fuzzy=llanowar%20el")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
