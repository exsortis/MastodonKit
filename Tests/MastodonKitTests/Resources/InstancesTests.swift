import XCTest
@testable import MastodonKit

class InstancesTests: XCTestCase {
    func testCurrent() {
        let resource = Instances.current()

        // Endpoint
        XCTAssertEqual(resource.path, "/api/v1/instance")

        // Method
        XCTAssertEqual(resource.method.name, "GET")
        XCTAssertNil(resource.method.httpBody)
        XCTAssertNil(resource.method.queryItems)

        // Parser
        XCTAssertTrue(type(of: resource.parse) == ParserFunctionType<Instance?>.self)
    }
}
