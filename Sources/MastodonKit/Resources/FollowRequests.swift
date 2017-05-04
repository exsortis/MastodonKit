import Foundation

public struct FollowRequests {
    /// Fetches a list of follow requests.
    ///
    /// - Returns: Resource for `[Account]`.
    public static func all() -> AccountsResource {
        return AccountsResource(path: "/api/v1/follow_requests", parse: AccountsResource.parser)
    }

    /// Authorizes a follow request.
    ///
    /// - Parameter id: The accound id.
    /// - Returns: Resource for `Account`.
    public static func authorize(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/follow_requests/\(id)/authorize", method: .post(Payload.empty), parse: AccountResource.parser)
    }

    /// Rejects a follow request.
    ///
    /// - Parameter id: The accound id.
    /// - Returns: Resource for `Account`.
    public static func reject(id: Int) -> AccountResource {
        return AccountResource(path: "/api/v1/follow_requests/\(id)/reject", method: .post(Payload.empty), parse: AccountResource.parser)
    }
}
