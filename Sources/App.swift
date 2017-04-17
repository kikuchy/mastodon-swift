import Foundation

public struct App {
    public let name: String
    public let redirect: RedirectOption
    public let scope: Set<Scope>
    public let website: URL?

    public init(name: String, redirects: RedirectOption, scopes: Set<Scope>, website: URL? = nil) {
        self.name = name
        self.redirect = redirects
        self.scope = scopes
        self.website = website
    }
}
