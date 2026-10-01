// Exercise 5 — protocol (see AdNetwork in Models.swift)

/// 5.1 Complete FakeNetwork:
///  - name, priority come from init
///  - load() always returns `result` and appends unitId to `requestedUnits`
/// (It's a class because load() isn't mutating but still needs to record requestedUnits.)
final class FakeNetwork: AdNetwork {
    private(set) var requestedUnits: [String] = []
    private let result: AdLoadResult

    // TODO: Ex05.1 — change the 2 computed properties below to `let name: String`, `let priority: Int` and assign them in init
    var name: String { "" }
    var priority: Int { -1 }

    init(name: String, priority: Int, result: AdLoadResult) {
        self.result = result
    }

    func load(unitId: String) -> AdLoadResult {
        return .failed(code: -1, message: "TODO: Ex05.1")
    }
}

/// 5.2 Waterfall mediation:
///  - try each network in DESCENDING priority order
///  - on the first .loaded → return immediately (later networks must not be called)
///  - no network loaded → .noFill
func waterfall(_ networks: [any AdNetwork], unitId: String) -> AdLoadResult {
    return .failed(code: -1, message: "TODO: Ex05.2")
}
