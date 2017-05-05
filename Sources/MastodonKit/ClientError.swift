import Foundation

public enum ClientError: Error {
    case malformedURL
    case mastodonError(String)
    case noData
    case dataSerializationError(Error)
    case unexpectedResponse
    case unsuccessfulResponse(Int)
}
