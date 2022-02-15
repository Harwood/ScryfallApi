//
//  GetAllSetsTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class GetAllSetsTests: XCTestCase {
    func test_urlRequest() throws {
        let request = ScryfallApi.GetAllSets()
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/sets", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
