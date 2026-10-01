// Exercise 6 — property wrapper (≈ property delegation) & forwarding (≈ class delegation)

/// 6.1 Always keep the value within `range`, including the initial value. Hint: min(max(v, lower), upper)
@propertyWrapper
struct ClampedDouble {
    private var value: Double
    private let range: ClosedRange<Double>

    init(wrappedValue: Double, _ range: ClosedRange<Double>) {
        self.range = range
        self.value = wrappedValue // TODO: Ex06.1 — clamp the initial value
    }

    var wrappedValue: Double {
        get { value }
        set { value = newValue } // TODO: Ex06.1 — clamp the new value
    }
}

struct BidSettings {
    @ClampedDouble(0...50) var floorUSD: Double = 0
}

/// 6.2 CountingNetwork wraps another network and counts how many times load() is called.
/// Swift has no `by inner` like Kotlin → forward name/priority to inner yourself.
final class CountingNetwork: AdNetwork {
    private let inner: any AdNetwork
    private(set) var loadCount = 0

    init(_ inner: any AdNetwork) { self.inner = inner }

    var name: String { "" }          // TODO: Ex06.2 — forward
    var priority: Int { -1 }         // TODO: Ex06.2 — forward

    func load(unitId: String) -> AdLoadResult {
        return .failed(code: -1, message: "TODO: Ex06.2") // increment loadCount, then call inner
    }
}
