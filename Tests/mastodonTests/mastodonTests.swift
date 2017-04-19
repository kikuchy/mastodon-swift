import XCTest
@testable import mastodon

class mastodonTests: XCTestCase {
    func testCreateApp() {
        let app = App(name: "Sample", redirects: .noRedirect, scopes: [.read, .write, .follow])
        let mastodon = Mastodon(httpClient: HttpClientStub())
        mastodon.register(for: URL(string: "https://mastodon.social")!, app: app) { token in
            XCTAssertNotNil(token)
        }
    }


    static var allTests = [
        ("testExample", testCreateApp),
    ]
}
