import XCTest
@testable import libraryExample

final class libraryExampleTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(libraryExample().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
