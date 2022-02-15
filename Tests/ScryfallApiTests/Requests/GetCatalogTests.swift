//
//  GetCatalogTests.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import XCTest
@testable import ScryfallApi

final class GetCatalogTests: XCTestCase {
    func test_urlRequest_cardNames() throws {
        let request = ScryfallApi.GetCatalog(named: .cardNames)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/card-names", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_artistNames() throws {
        let request = ScryfallApi.GetCatalog(named: .artistNames)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/artist-names", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_wordBank() throws {
        let request = ScryfallApi.GetCatalog(named: .wordBank)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/word-bank", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_creatureTypes() throws {
        let request = ScryfallApi.GetCatalog(named: .creatureTypes)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/creature-types", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_planeswalkerTypes() throws {
        let request = ScryfallApi.GetCatalog(named: .planeswalkerTypes)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/planeswalker-types", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_landTypes() throws {
        let request = ScryfallApi.GetCatalog(named: .landTypes)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/land-types", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_artifactTypes() throws {
        let request = ScryfallApi.GetCatalog(named: .artifactTypes)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/artifact-types", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_enchantmentTypes() throws {
        let request = ScryfallApi.GetCatalog(named: .enchantmentTypes)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/enchantment-types", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_spellTypes() throws {
        let request = ScryfallApi.GetCatalog(named: .spellTypes)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/spell-types", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_powers() throws {
        let request = ScryfallApi.GetCatalog(named: .powers)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/powers", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_toughnesses() throws {
        let request = ScryfallApi.GetCatalog(named: .toughnesses)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/toughnesses", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_loyalties() throws {
        let request = ScryfallApi.GetCatalog(named: .loyalties)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/loyalties", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_watermarks() throws {
        let request = ScryfallApi.GetCatalog(named: .watermarks)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/watermarks", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_keywordAbilities() throws {
        let request = ScryfallApi.GetCatalog(named: .keywordAbilities)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/keyword-abilities", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_keywordActions() throws {
        let request = ScryfallApi.GetCatalog(named: .keywordActions)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/keyword-actions", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }

    func test_urlRequest_abilityWords() throws {
        let request = ScryfallApi.GetCatalog(named: .abilityWords)
        let urlRequest = try request.makeURLRequest()
        XCTAssertURL(urlRequest.url, path: "/catalog/ability-words", query: "")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
    }
}
