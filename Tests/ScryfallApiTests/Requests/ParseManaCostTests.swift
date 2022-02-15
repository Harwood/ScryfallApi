//
//  ParseManaCostTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class ParseManaCostTests: XCTestCase {
    func test_urlRequest_manaCost() throws {
        let request = ScryfallApi.ParseManaCost(manaCost: "8{U}{R}")
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/symbology/parse-mana", query: "?cost=8%7BU%7D%7BR%7D")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_manaCostIsEmpty() throws {
        let request = ScryfallApi.ParseManaCost(manaCost: "")
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/symbology/parse-mana", query: "?cost=")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
