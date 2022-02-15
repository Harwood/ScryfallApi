//
//  GetCardCollectionTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class GetCardCollectionTests: XCTestCase {
    func test_urlRequest() throws {
        let identifiers: [ScryfallApi.GetCardCollection.Input.Identifier] = [
            .scryfall(UUID(uuidString: "9129baf5-ffa9-4ffb-bcab-19d6a42dbfcc")!),
            .mtgo(45062),
            .multiverse(265154),
            .oracle(UUID(uuidString: "ad9b7fbc-61c8-43ee-a65c-99206fd1e4df")!),
            .illustration(UUID(uuidString: "05580cef-2d91-4c75-9a58-fbd39a545303")!),
            .name("Maelstrom Wanderer"),
            .nameSetCode(name: "Maelstrom Wanderer", setCode: "pc2"),
            .collectorNumberSetCode(collectorNumber: "101", setCode: "pc2")
        ]
        let request = ScryfallApi.GetCardCollection(input: .init(identifiers: identifiers))
        let urlRequest = try request.makeURLRequest()
        let cardIdentifiersData = try ResourceLoader.data(for: .cardIdentifiers)

        XCTAssertURL(urlRequest.url, path: "/cards/collection", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "POST")
        XCTAssertEqual(urlRequest.value(forHTTPHeaderField: "Content-type"), "application/json")
        XCTAssertEqual(urlRequest.httpBody, cardIdentifiersData)
    }
}
