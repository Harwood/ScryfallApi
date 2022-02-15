//
//  GetAllBulkDataTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class GetAllBulkDataTests: XCTestCase {
    func test_urlRequest() throws {
        let request = ScryfallApi.GetAllBulkData()
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/bulk-data", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
