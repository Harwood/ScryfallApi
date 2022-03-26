/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

import XCTest
@testable import ScryfallApi

final class ScryfallTests: XCTestCase {
    func test_sendRequest_returnsRequestResponse() async throws {
        let mockResponseData = try ResourceLoader.data(for: .mockResponse)
        let networkSession = MockNetworkSession(data: mockResponseData)
        let scryfall = Scryfall(networkSession: networkSession)
        do {
            let result = try await scryfall.send(request: MockScryfallRequest())
            let expectedResponse = try JSONDecoder().decode(MockScryfallResponse.self, from: mockResponseData)
            XCTAssertEqual(result.response, expectedResponse)
        } catch {
            XCTFail("Expected to return success response from Scryfall API, but threw an error")
        }
    }

    func test_sendRequest_throwsErrorResponse() async throws {
        let errorResponseData = try ResourceLoader.data(for: .errorResponse)
        let networkSession = MockNetworkSession(data: errorResponseData)
        let scryfall = Scryfall(networkSession: networkSession)
        let request = MockScryfallRequest()
        do {
            _ = try await scryfall.send(request: request)
            XCTFail("Expected to throw error response from Scryfall API, but succeeded")
        } catch {
            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: errorResponseData)
            XCTAssertEqual(error as? ScryfallError<MockScryfallRequest>, .errorResponse(request, errorResponse))
        }
    }

    func test_sendRequest_throwsUnknownResponse() async throws {
        let unknownResponseData = try ResourceLoader.data(for: .unknownResponse)
        let networkSession = MockNetworkSession(data: unknownResponseData)
        let scryfall = Scryfall(networkSession: networkSession)
        let request = MockScryfallRequest()
        do {
            _ = try await scryfall.send(request: request)
            XCTFail("Expected to throw invalid response from Scryfall API, but succeeded")
        } catch {
            XCTAssertEqual(error as? ScryfallError<MockScryfallRequest>, .unknownResponse(request))
        }
    }

    func test_sendRequests_returnsResponseForEveryRequest() async throws {
        let mockResponseData = try ResourceLoader.data(for: .mockResponse)
        let networkSession = MockNetworkSession(data: mockResponseData)
        let scryfall = Scryfall(networkSession: networkSession)
        let requests = Array(repeating: MockScryfallRequest(), count: 5)
        do {
            let results = try await scryfall.send(requests: requests)
            let expectedResponse = try JSONDecoder().decode(MockScryfallResponse.self, from: mockResponseData)
            let expectedResponses = Array(repeating: expectedResponse, count: requests.count)
            XCTAssertEqual(results.map { $0.response }, expectedResponses)
        } catch {
            XCTFail("Expected to return success responses from Scryfall API, but threw an error")
        }
    }
}
