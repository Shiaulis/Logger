import XCTest
@testable import Logger

final class LoggerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertNotNil(PrintLogger())
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
