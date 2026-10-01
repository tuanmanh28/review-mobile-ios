@propertyWrapper
struct ClampedDouble {
    private var value: Double
    private let range: ClosedRange<Double>

    init(wrappedValue: Double, _ range: ClosedRange<Double>) {
        self.range = range
        self.value = min(max(wrappedValue, range.lowerBound), range.upperBound)
    }

    var wrappedValue: Double {
        get { value }
        set { value = min(max(newValue, range.lowerBound), range.upperBound) }
    }
}

struct BidSettings {
    @ClampedDouble(0...50) var floorUSD: Double = 0
}

final class CountingNetwork: AdNetwork {
    private let inner: any AdNetwork
    private(set) var loadCount = 0

    init(_ inner: any AdNetwork) { self.inner = inner }

    var name: String { inner.name }
    var priority: Int { inner.priority }

    func load(unitId: String) -> AdLoadResult {
        loadCount += 1
        return inner.load(unitId: unitId)
    }
}
