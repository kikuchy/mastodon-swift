import XCTest
@testable import mastodon

class mastodonTests: XCTestCase {
    func testCreateApp() {
        let _ = App(name: "Sample", redirects: .noRedirect, scopes: [.read, .write, .follow])
    }


    static var allTests = [
        ("testExample", testCreateApp),
    ]
}
