//
//  GetAllCardSymbolsTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class GetAllCardSymbolsTests: XCTestCase {
    func test_urlRequest() throws {
        let request = ScryfallApi.GetAllCardSymbols()
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/symbology", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
