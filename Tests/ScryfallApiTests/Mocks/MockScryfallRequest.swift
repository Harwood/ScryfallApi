//
//  MockScryfallRequest.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation
@testable import ScryfallApi

struct MockScryfallResponse: Equatable, Codable {
    let type: String
    let data: String
}

struct MockScryfallRequest: ScryfallRequest {
    typealias Response = MockScryfallResponse
    var path: String = ""
    var queryItems: [URLQueryItem] = []
    var httpMethod: HTTPMethod = .GET
}
