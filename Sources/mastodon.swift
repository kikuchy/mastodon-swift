import Foundation

public class Mastodon {
    let httpClient: HttpClient
    
    public init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }

    public func register(for instance: URL, app: App) throws -> LogoutedClient {
        let redirect: String
        switch app.redirect {
        case let .redirect(url: url):
            redirect = url.absoluteString
        case .noRedirect:
            redirect = "urn:ietf:wg:oauth:2.0:oob"
        }
        
        var body: [String: Any] = [
            "client_name": app.name,
            "redirect_uris": redirect,
            "scopes": app.scope.reduce("", { mid, val -> String in
                return "\(mid) \(val)"
            }),
        ]
        app.website.map { body["website"] = $0.absoluteString }
        
        self.httpClient.post()
        
        return LogoutedClientImpl(with: app, via: self.httpClient)
    }
}
