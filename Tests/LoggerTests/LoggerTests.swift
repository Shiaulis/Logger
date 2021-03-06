import XCTest
@testable import Logger

private struct TestLoggerModule: LoggerModule {}

final class LoggerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertNotNil(PrintLogger(loggerModule: TestLoggerModule()))
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
