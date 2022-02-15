//
//  GetRulingsTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class GetRulingsTests: XCTestCase {
    func test_urlRequest_scryfallID() throws {
        let uuid = UUID()
        let request = ScryfallApi.GetRulings(identifier: .scryfall(uuid))
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/\(uuid.uuidString)/rulings", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_arenaID() throws {
        let request = ScryfallApi.GetRulings(identifier: .arena(123))
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/arena/123/rulings", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_mtgoID() throws {
        let request = ScryfallApi.GetRulings(identifier: .mtgo(456))
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/mtgo/456/rulings", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_multiverseID() throws {
        let request = ScryfallApi.GetRulings(identifier: .multiverse(789))
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/multiverse/789/rulings", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_setCode_collectorNumber() throws {
        let request = ScryfallApi.GetRulings(setCode: "abc", collectorNumber: "123")
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/abc/123/rulings", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
