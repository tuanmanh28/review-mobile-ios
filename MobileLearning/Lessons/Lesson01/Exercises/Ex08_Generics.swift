// Exercise 8 — generics, some / any

extension Array {
    /// 8.1 The second element, or nil if there are fewer than 2 elements.
    var secondOrNil: Element? {
        return nil // TODO: Ex08.1
    }
}

/// 8.2 Return a network with name "TestNet", priority 99, and load() always .noFill.
/// The return type is `some AdNetwork`: create your own struct (e.g. TestNetwork) and return it.
struct PlaceholderNetwork: AdNetwork {
    let name = "TODO"
    func load(unitId: String) -> AdLoadResult { .noFill }
}

func makeTestNetwork() -> some AdNetwork {
    return PlaceholderNetwork() // TODO: Ex08.2
}

/// 8.3 Take an existential array `[any AdNetwork]`, return the network with the highest priority (nil if empty).
func highestPriority(_ networks: [any AdNetwork]) -> (any AdNetwork)? {
    return nil // TODO: Ex08.3
}

/// 8.4 A cache with expiry (TTL).
///  - set(_:for:): store along with the current time = clock()
///  - value(for:): return the value if (clock() - stored time) < ttlMs; if expired, REMOVE it and return nil
final class TtlCache<Key: Hashable, Value> {
    private let ttlMs: Int
    private let clock: () -> Int

    init(ttlMs: Int, clock: @escaping () -> Int) {
        self.ttlMs = ttlMs
        self.clock = clock
    }

    func set(_ value: Value, for key: Key) {
        // TODO: Ex08.4
    }

    func value(for key: Key) -> Value? {
        return nil // TODO: Ex08.4
    }

    var count: Int { -1 } // TODO: Ex08.4
}
