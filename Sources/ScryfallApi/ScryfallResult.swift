/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

public struct ScryfallResult<T: ScryfallOperation>: Equatable {
    /// Descriptive information about the request that can be used for discovery and identification.
    public let metadata: String?
    /// A ScryfallOperation that provides request-specific information such as the URL and body data.
    public let operation: T
    /// A ScryfallOperation.Response that was returned by the Scryfall Api.
    public let response: T.Response
}
