//
//  PageTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class PageTests: XCTestCase {
    func test_decodedFromScryfallResponse() throws {
        let data = try ResourceLoader.data(for: .page)
        XCTAssertNoThrow(try JSONDecoder().decode(ScryfallApi.Page<String>.self, from: data))
    }
}
