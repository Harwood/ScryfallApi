//
//  GetRandomCardTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class GetRandomCardTests: XCTestCase {
    func test_urlRequest_filter() throws {
        let request = ScryfallApi.GetRandomCard()
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/random", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_filterIsEmpty() throws {
        let request = ScryfallApi.GetRandomCard(filter: "")
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/random", query: "?q=")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_filterIsNil() throws {
        let request = ScryfallApi.GetRandomCard(filter: "llanow el")
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/random", query: "?q=llanow%20el")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
