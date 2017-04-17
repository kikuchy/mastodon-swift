import Foundation

public protocol LogoutedClient {

}

public class LogoutedClientImpl: LogoutedClient {
    let client: HttpClient
    let app: App

    init(with app: App, via client: HttpClient) {
        self.app = app
        self.client = client
    }
}
