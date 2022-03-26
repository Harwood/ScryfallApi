/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class RulingTests: XCTestCase {
    func test_decodedFromScryfallResponse() throws {
        let data = try ResourceLoader.data(for: .ruling)
        XCTAssertNoThrow(try JSONDecoder().decode(ScryfallApi.Ruling.self, from: data))
    }
}
