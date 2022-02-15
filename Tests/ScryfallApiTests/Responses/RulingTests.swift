//
//  RulingTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class RulingTests: XCTestCase {
    func test_decodedFromScryfallResponse() throws {
        let data = try ResourceLoader.data(for: .ruling)
        XCTAssertNoThrow(try JSONDecoder().decode(ScryfallApi.Ruling.self, from: data))
    }
}
