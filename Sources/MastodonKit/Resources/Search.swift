import Foundation

public struct Search {
    /// Searches for content.
    ///
    /// - Parameters:
    ///   - query: The search query.
    ///   - resolve: Whether to resolve non-local accounts.
    /// - Returns: Resource for `Results`.
    public static func search(query: String, resolve: Bool? = nil) -> ResultsResource {
        let parameters = [
            Parameter(name: "q", value: query),
            Parameter(name: "resolve", value: resolve.flatMap(nilOrTrue))
        ]

        let method = HTTPMethod.get(Payload.parameters(parameters))
        return ResultsResource(path: "/api/v1/search", method: method, parse: ResultsResource.parser)
    }
}
