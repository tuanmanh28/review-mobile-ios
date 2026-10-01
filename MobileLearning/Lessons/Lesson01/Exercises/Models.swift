// Shared types for the exercises — DON'T edit this file.

enum AdLoadResult: Equatable {
    case loaded(network: String, ecpm: Double)
    case noFill
    case failed(code: Int, message: String)
}

protocol AdNetwork {
    var name: String { get }
    var priority: Int { get }
    func load(unitId: String) -> AdLoadResult
}

extension AdNetwork {
    var priority: Int { 0 }
}

enum AdEvent: Equatable {
    case impression(network: String, revenueMicros: Int64)
    case click(network: String)
    case loadFailed(network: String, code: Int)
    case closed
}
