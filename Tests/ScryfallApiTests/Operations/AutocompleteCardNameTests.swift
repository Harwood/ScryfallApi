/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class AutocompleteCardNameTests: XCTestCase {
    func test_urlRequest_candidate() throws {
        let operation = ScryfallApi.AutocompleteCardName(candidate: "llanowar el")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/autocomplete", query: "?q=llanowar%20el")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_candidateIsEmpty() throws {
        let operation = ScryfallApi.AutocompleteCardName(candidate: "")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/autocomplete", query: "?q=")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_candidate_includeExtras() throws {
        let operation = ScryfallApi.AutocompleteCardName(candidate: "aus", includeExtras: true)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/autocomplete", query: "?q=aus&include_extras=true")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
