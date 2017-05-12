import Foundation

public enum ClientError: Error {
    /// Failed to build the URL to make the request.
    case malformedURL
    /// The Mastodon service returned an error.
    case mastodonError(String)
    case noData
    case dataSerializationError(Error)
    case unexpectedResponse
    case unsuccessfulResponse(Int)
    /// Failed to parse the response from Mastodon.
    case dataError
}
