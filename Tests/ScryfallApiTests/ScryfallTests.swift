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
            let request = ScryfallRequest(
                metadata: "test_sendRequest_returnsRequestResponse",
                operation: MockScryfallOperation()
            )
            let result = try await scryfall.send(request: request)
            let expectedResponse = try JSONDecoder().decode(MockScryfallResponse.self, from: mockResponseData)
            XCTAssertEqual(result.response, expectedResponse)
            XCTAssertEqual(result.operation, request.operation)
            XCTAssertEqual(result.metadata, request.metadata)
        } catch {
            XCTFail("Expected to return success response from Scryfall API, but threw an error")
        }
    }

    func test_sendRequest_throwsErrorResponse() async throws {
        let errorResponseData = try ResourceLoader.data(for: .errorResponse)
        let networkSession = MockNetworkSession(data: errorResponseData)
        let scryfall = Scryfall(networkSession: networkSession)
        let request = ScryfallRequest(operation: MockScryfallOperation())
        do {
            _ = try await scryfall.send(request: request)
            XCTFail("Expected to throw error response from Scryfall API, but succeeded")
        } catch {
            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: errorResponseData)
            XCTAssertEqual(error as? ScryfallError<MockScryfallOperation>, .errorResponse(request.operation, errorResponse))
        }
    }

    func test_sendRequest_throwsUnknownResponse() async throws {
        let unknownResponseData = try ResourceLoader.data(for: .unknownResponse)
        let networkSession = MockNetworkSession(data: unknownResponseData)
        let scryfall = Scryfall(networkSession: networkSession)
        let request = ScryfallRequest(operation: MockScryfallOperation())
        do {
            _ = try await scryfall.send(request: request)
            XCTFail("Expected to throw invalid response from Scryfall API, but succeeded")
        } catch {
            XCTAssertEqual(error as? ScryfallError<MockScryfallOperation>, .unknownResponse(request.operation))
        }
    }

    func test_sendRequests_returnsResponseForEveryRequest() async throws {
        let mockResponseData = try ResourceLoader.data(for: .mockResponse)
        let networkSession = MockNetworkSession(data: mockResponseData)
        let scryfall = Scryfall(networkSession: networkSession)
        let request = ScryfallRequest(
            metadata: "test_sendRequests_returnsResponseForEveryRequest",
            operation: MockScryfallOperation()
        )
        let requests = Array(repeating: request, count: 5)
        do {
            let results = try await scryfall.send(requests: requests)
            let expectedResult = ScryfallResult(
                metadata: request.metadata,
                operation: request.operation,
                response: try JSONDecoder().decode(MockScryfallResponse.self, from: mockResponseData)
            )
            let expectedResults = Array(repeating: expectedResult, count: requests.count)
            XCTAssertEqual(results, expectedResults)
        } catch {
            XCTFail("Expected to return success responses from Scryfall API, but threw an error")
        }
    }
}
