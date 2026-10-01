extension Array {
    var secondOrNil: Element? {
        count >= 2 ? self[1] : nil
    }
}

struct PlaceholderNetwork: AdNetwork {
    let name = "TODO"
    func load(unitId: String) -> AdLoadResult { .noFill }
}

struct TestNetwork: AdNetwork {
    let name = "TestNet"
    let priority = 99
    func load(unitId: String) -> AdLoadResult { .noFill }
}

func makeTestNetwork() -> some AdNetwork {
    TestNetwork()
}

func highestPriority(_ networks: [any AdNetwork]) -> (any AdNetwork)? {
    networks.max { $0.priority < $1.priority }
}

final class TtlCache<Key: Hashable, Value> {
    private struct Entry {
        let value: Value
        let storedAt: Int
    }

    private let ttlMs: Int
    private let clock: () -> Int
    private var entries: [Key: Entry] = [:]

    init(ttlMs: Int, clock: @escaping () -> Int) {
        self.ttlMs = ttlMs
        self.clock = clock
    }

    func set(_ value: Value, for key: Key) {
        entries[key] = Entry(value: value, storedAt: clock())
    }

    func value(for key: Key) -> Value? {
        guard let entry = entries[key] else { return nil }
        if clock() - entry.storedAt >= ttlMs {
            entries[key] = nil
            return nil
        }
        return entry.value
    }

    var count: Int { entries.count }
}
