//
//  GetCardTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class GetCardTests: XCTestCase {
    func test_urlRequest_scryfallID() throws {
        let uuid = UUID()
        let request = ScryfallApi.GetCard(identifier: .scryfall(uuid))
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/\(uuid.uuidString)", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_arenaID() throws {
        let request = ScryfallApi.GetCard(identifier: .arena(123))
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/arena/123", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_cardmarketID() throws {
        let request = ScryfallApi.GetCard(identifier: .cardmarket(123))
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/cardmarket/123", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_mtgoID() throws {
        let request = ScryfallApi.GetCard(identifier: .mtgo(123))
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/mtgo/123", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_multiverseID() throws {
        let request = ScryfallApi.GetCard(identifier: .multiverse(123))
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/multiverse/123", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_tcgplayerID() throws {
        let request = ScryfallApi.GetCard(identifier: .tcgplayer(123))
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/tcgplayer/123", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_setCode_collectorNumber_language() throws {
        let request = ScryfallApi.GetCard(setCode: "abc", collectorNumber: "123", language: "en")
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/abc/123/en", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_setCode_collectorNumber_languageIsNil() throws {
        let request = ScryfallApi.GetCard(setCode: "abc", collectorNumber: "123")
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/abc/123", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_exactName_setCode() throws {
        let request = ScryfallApi.GetCard(exactName: "llano", setCode: "abc")
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/named", query: "?exact=llano&set=abc")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_exactName_setCodeIsNil() throws {
        let request = ScryfallApi.GetCard(exactName: "llanowar el")
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/named", query: "?exact=llanowar%20el")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_fuzzyName_setCode() throws {
        let request = ScryfallApi.GetCard(fuzzyName: "llano", setCode: "abc")
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/named", query: "?fuzzy=llano&set=abc")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_fuzzyName_setCodeIsNil() throws {
        let request = ScryfallApi.GetCard(fuzzyName: "llanowar el")
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/named", query: "?fuzzy=llanowar%20el")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
