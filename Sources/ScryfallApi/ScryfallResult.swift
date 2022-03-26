/**
*  ScryfallApi
*  Copyright © 2022 Gauntlet. All rights reserved.
*  MIT license, see LICENSE file for details.
*/

public struct ScryfallResult<T: ScryfallRequest> {
    public let request: T
    public let response: T.Response
}
