//
//  MockNetworkSession.swift
//  ScryfallApiTests
//
//  Created by Scott Campbell on 2/11/22.
//  Copyright © 2022 Gauntlet. All rights reserved.
//

import Foundation
@testable import ScryfallApi

struct MockNetworkSession: NetworkSession {
    let data: Data
    let urlResponse: URLResponse = URLResponse()

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        (data, urlResponse)
    }
}
