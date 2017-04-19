import XCTest
@testable import mastodon
import MirrorDiffKit

class mastodonTests: XCTestCase {
    func testCreateApp() {
        let expect = ClientToken(clientId: "", clientSecret: "", scopes: [.read, .write, .follow])
        let app = App(name: "Sample", redirects: .noRedirect, scopes: [.read, .write, .follow])
        let mastodon = Mastodon(httpClient: HttpClientStub())

        let token = doSync { done in
            mastodon.register(for: URL(string: "https://mastodon.social")!, app: app) { token in
                done(token)
            }
        }
        XCTAssert(Diffable.from(any: token) =~ Diffable.from(any: expect), diff(between: token, and: expect))
    }


    static var allTests = [
        ("testExample", testCreateApp),
    ]
}
