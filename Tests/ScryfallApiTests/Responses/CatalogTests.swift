//
//  CatalogTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class CatalogTests: XCTestCase {
    func test_decodedFromScryfallResponse() throws {
        let data = try ResourceLoader.data(for: .catalog)
        XCTAssertNoThrow(try JSONDecoder().decode(ScryfallApi.Catalog.self, from: data))
    }
}
