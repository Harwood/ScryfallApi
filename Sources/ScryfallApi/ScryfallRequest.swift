/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

public struct ScryfallRequest<T: ScryfallOperation>: Equatable {
    /// Descriptive information about the request that can be used for discovery and identification.
    public let metadata: String?
    /// A ScryfallOperation that provides request-specific information such as the URL and body data.
    public let operation: T
    
    /// Provides request-specific information such as the operation to execute, and descriptive metadata.
    ///
    /// - Parameter metadata: Descriptive information about the request that can be used for discovery and identification.
    /// - Parameter operation: A ScryfallOperation that provides request-specific information such as the URL and body data.
    public init(metadata: String? = nil, operation: T) {
        self.metadata = metadata
        self.operation = operation
    }
}
