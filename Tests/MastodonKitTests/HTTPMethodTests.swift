import XCTest
@testable import MastodonKit

class HTTPMethodTests: XCTestCase {
    func testGet() {
        let parameters = [
            Parameter(name: "number", value: String(42)),
            Parameter(name: "url", value: "https://mastodon.technology"),
            Parameter(name: "nilValue", value: nil)
        ]

        let payload = Payload.parameters(parameters)
        let method = HTTPMethod.get(payload)

        // Name
        XCTAssertEqual(method.name, "GET")

        // Query items
        XCTAssertEqual(method.queryItems?.count, 2)
        XCTAssertEqual(method.queryItems!, payload.items!)

        // HTTP body
        XCTAssertNil(method.httpBody)

        // Content Type
        XCTAssertNil(method.contentType)
    }

    func testPost() {
        let parameters = [
            Parameter(name: "number", value: String(42)),
            Parameter(name: "url", value: "https://mastodon.technology"),
            Parameter(name: "nilValue", value: nil)
        ]

        let payload = Payload.parameters(parameters)
        let method = HTTPMethod.post(payload)

        // Name
        XCTAssertEqual(method.name, "POST")

        // Query items
        XCTAssertNil(method.queryItems)

        // HTTP body
        XCTAssertNotNil(method.httpBody)
        XCTAssertEqual(method.httpBody, payload.data)

        // Content Type
        XCTAssertNotNil(method.contentType)
        XCTAssertEqual(method.contentType, payload.type)
    }

    func testPatch() {
        let parameters = [
            Parameter(name: "number", value: String(42)),
            Parameter(name: "url", value: "https://mastodon.technology"),
            Parameter(name: "nilValue", value: nil)
        ]

        let payload = Payload.parameters(parameters)
        let method = HTTPMethod.patch(payload)

        // Name
        XCTAssertEqual(method.name, "PATCH")

        // Query items
        XCTAssertNil(method.queryItems)

        // HTTP body
        XCTAssertNotNil(method.httpBody)
        XCTAssertEqual(method.httpBody, payload.data)

        // Content Type
        XCTAssertNotNil(method.contentType)
        XCTAssertEqual(method.contentType, payload.type)
    }

    func testDelete() {
        let method = HTTPMethod.delete

        // Name
        XCTAssertEqual(method.name, "DELETE")

        // Query items
        XCTAssertNil(method.queryItems)

        // HTTP body
        XCTAssertNil(method.httpBody)

        // Content Type
        XCTAssertNil(method.contentType)
    }
}
