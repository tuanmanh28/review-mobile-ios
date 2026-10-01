final class FakeNetwork: AdNetwork {
    private(set) var requestedUnits: [String] = []
    private let result: AdLoadResult
    let name: String
    let priority: Int

    init(name: String, priority: Int, result: AdLoadResult) {
        self.name = name
        self.priority = priority
        self.result = result
    }

    func load(unitId: String) -> AdLoadResult {
        requestedUnits.append(unitId)
        return result
    }
}

func waterfall(_ networks: [any AdNetwork], unitId: String) -> AdLoadResult {
    for network in networks.sorted(by: { $0.priority > $1.priority }) {
        let result = network.load(unitId: unitId)
        if case .loaded = result { return result }
    }
    return .noFill
}
