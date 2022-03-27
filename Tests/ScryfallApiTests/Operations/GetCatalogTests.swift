/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class GetCatalogTests: XCTestCase {
    func test_urlRequest_cardNames() throws {
        let operation = ScryfallApi.GetCatalog(named: .cardNames)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/card-names", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_artistNames() throws {
        let operation = ScryfallApi.GetCatalog(named: .artistNames)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/artist-names", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_wordBank() throws {
        let operation = ScryfallApi.GetCatalog(named: .wordBank)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/word-bank", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_creatureTypes() throws {
        let operation = ScryfallApi.GetCatalog(named: .creatureTypes)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/creature-types", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_planeswalkerTypes() throws {
        let operation = ScryfallApi.GetCatalog(named: .planeswalkerTypes)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/planeswalker-types", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_landTypes() throws {
        let operation = ScryfallApi.GetCatalog(named: .landTypes)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/land-types", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_artifactTypes() throws {
        let operation = ScryfallApi.GetCatalog(named: .artifactTypes)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/artifact-types", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_enchantmentTypes() throws {
        let operation = ScryfallApi.GetCatalog(named: .enchantmentTypes)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/enchantment-types", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_spellTypes() throws {
        let operation = ScryfallApi.GetCatalog(named: .spellTypes)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/spell-types", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_powers() throws {
        let operation = ScryfallApi.GetCatalog(named: .powers)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/powers", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_toughnesses() throws {
        let operation = ScryfallApi.GetCatalog(named: .toughnesses)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/toughnesses", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_loyalties() throws {
        let operation = ScryfallApi.GetCatalog(named: .loyalties)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/loyalties", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_watermarks() throws {
        let operation = ScryfallApi.GetCatalog(named: .watermarks)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/watermarks", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_keywordAbilities() throws {
        let operation = ScryfallApi.GetCatalog(named: .keywordAbilities)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/keyword-abilities", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_keywordActions() throws {
        let operation = ScryfallApi.GetCatalog(named: .keywordActions)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/keyword-actions", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_abilityWords() throws {
        let operation = ScryfallApi.GetCatalog(named: .abilityWords)
        let urlRequest = try operation.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/ability-words", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
