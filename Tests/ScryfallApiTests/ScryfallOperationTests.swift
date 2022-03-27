/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class ScryfallOperationTests: XCTestCase {
    func test_makeURL_omittsEmptyQueryItems() throws {
        let operation = MockScryfallOperation(path: "/test", queryItems: [], httpMethod: .GET)
        let url = try operation.makeURL()
        XCTAssertURL(url, path: "/test", query: "")
    }

    func test_makeURL_omittsQueryItemsWithNilValues() throws {
        let queryItems = [URLQueryItem(name: "a", value: "b"), URLQueryItem(name: "c", value: nil)]
        let operation = MockScryfallOperation(path: "/test", queryItems: queryItems, httpMethod: .GET)
        let url = try operation.makeURL()
        XCTAssertURL(url, path: "/test", query: "?a=b")
    }

    func test_makeURLRequest_urlMatchesMakeURL() throws {
        let queryItems = [URLQueryItem(name: "a", value: "b")]
        let operation = MockScryfallOperation(path: "/test/path", queryItems: queryItems, httpMethod: .GET)
        let expectedURL = try operation.makeURL()
        let actualURL = try operation.makeURLRequest().url
        XCTAssertEqual(expectedURL, actualURL)
    }

    func test_makeURLRequest_GET_httpBodyIsNil() throws {
        let operation = MockScryfallOperation(path: "/test", queryItems: [], httpMethod: .GET)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertNil(urlRequest.httpBody)
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_makeURLRequest_POST_httpBodyIsNil() throws {
        let contentType = "application/json"
        let operation = MockScryfallOperation(path: "", queryItems: [], httpMethod: .POST(httpBody: nil, contentType: contentType))
        let urlRequest = try operation.makeURLRequest()
        XCTAssertNil(urlRequest.httpBody)
        XCTAssertEqual(urlRequest.httpMethod, "POST")
        XCTAssertEqual(urlRequest.value(forHTTPHeaderField: "Content-Type"), contentType)
    }

    func test_makeURLRequest_POST_httpBodyIsPopulated() throws {
        let data = Data([1, 2, 3, 4, 5])
        let contentType = "application/json"
        let operation = MockScryfallOperation(path: "", queryItems: [], httpMethod: .POST(httpBody: data, contentType: contentType))
        let urlRequest = try operation.makeURLRequest()
        XCTAssertEqual(urlRequest.httpBody, data)
        XCTAssertEqual(urlRequest.httpMethod, "POST")
        XCTAssertEqual(urlRequest.value(forHTTPHeaderField: "Content-Type"), contentType)
    }
}
