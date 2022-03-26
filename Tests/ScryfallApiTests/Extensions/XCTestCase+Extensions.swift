/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

extension XCTestCase {
    /// Assert that the given URL points to the Scryfall API endpoint and that is contains the expected path and query components.
    ///
    /// - Parameter url: The candidate URL.
    /// - Parameter path: The expected path component for the given URL.
    /// - Parameter query: The expected query component for the given URL.
    func XCTAssertURL(_ url: URL?, path: String, query: String, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(url, URL(string: "\(ScryfallApi.scheme)://\(ScryfallApi.host)\(path)\(query)"), file: file, line: line)
    }
}
