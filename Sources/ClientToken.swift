import Foundation

public struct ClientToken {
    public let clientId: String
    public let clientSecret: String
    public let scopes: Set<Scope>
}
