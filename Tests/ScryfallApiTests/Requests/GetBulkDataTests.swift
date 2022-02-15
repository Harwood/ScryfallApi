//
//  GetBulkDataTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class GetBulkDataTests: XCTestCase {
    func test_urlRequest_id() throws {
        let uuid = UUID()
        let request = ScryfallApi.GetBulkData(id: uuid)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/bulk-data/\(uuid.uuidString)", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_type() throws {
        let request = ScryfallApi.GetBulkData(type: "abc")
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/bulk-data/abc", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
