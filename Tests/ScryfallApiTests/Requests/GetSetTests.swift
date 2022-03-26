/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class GetSetTests: XCTestCase {
    func test_urlRequest_scryfallID() throws {
        let uuid = UUID()
        let request = ScryfallApi.GetSet(identifier: .scryfall(uuid))
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/sets/\(uuid.uuidString)", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_tcgplayerID() throws {
        let request = ScryfallApi.GetSet(identifier: .tcgplayer(123))
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/sets/tcgplayer/123", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_setCode() throws {
        let request = ScryfallApi.GetSet(setCode: "abc")
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/sets/abc", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
