/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class SearchCardsTests: XCTestCase {
    func test_urlRequest_defaultValues() throws {
        let operation = ScryfallApi.SearchCards(searchTerm: "llanowar el")
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/search", query: "?q=llanowar%20el&order=name&dir=auto&unique=cards&page=1&include_extras=false&include_multilingual=false&include_variations=false")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_nonDefaultValues() throws {
        let operation = ScryfallApi.SearchCards(
            searchTerm: "",
            orderedBy: .power,
            direction: .desc,
            uniquedBy: .prints,
            page: 5,
            includeExtras: true,
            includeMultilingual: true,
            includeVariations: true
        )
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/cards/search", query: "?q=&order=power&dir=desc&unique=prints&page=5&include_extras=true&include_multilingual=true&include_variations=true")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
