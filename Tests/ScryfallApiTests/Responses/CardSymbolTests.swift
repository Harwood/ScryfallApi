//
//  CardSymbolTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class CardSymbolTests: XCTestCase {
    func test_decodedFromScryfallResponse() throws {
        let data = try ResourceLoader.data(for: .cardSymbol)
        XCTAssertNoThrow(try JSONDecoder().decode(ScryfallApi.CardSymbol.self, from: data))
    }
}
