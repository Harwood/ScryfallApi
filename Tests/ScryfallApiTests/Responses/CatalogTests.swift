/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class CatalogTests: XCTestCase {
    func test_decodedFromScryfallResponse() throws {
        let data = try ResourceLoader.data(for: .catalog)
        XCTAssertNoThrow(try JSONDecoder().decode(ScryfallApi.Catalog.self, from: data))
    }
}
