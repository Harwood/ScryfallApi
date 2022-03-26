/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class ManaCostTests: XCTestCase {
    func test_decodedFromScryfallResponse() throws {
        let data = try ResourceLoader.data(for: .manaCost)
        XCTAssertNoThrow(try JSONDecoder().decode(ScryfallApi.ManaCost.self, from: data))
    }
}
