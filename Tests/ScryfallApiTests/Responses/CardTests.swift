//
//  CardTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class CardTests: XCTestCase {
    func test_decodedFromScryfallResponse() throws {
        let data = try ResourceLoader.data(for: .card)
        XCTAssertNoThrow(try JSONDecoder().decode(ScryfallApi.Card.self, from: data))
    }
}
