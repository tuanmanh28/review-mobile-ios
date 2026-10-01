/// 6. Property wrapper — the equivalent of Kotlin's property delegation (`by`)
///
///     @Clamped(15...120) var refreshSec: Int = 30
/// the compiler turns it into:
///     private var _refreshSec = Clamped(wrappedValue: 30, 15...120)
///     var refreshSec: Int { get { _refreshSec.wrappedValue } set { _refreshSec.wrappedValue = newValue } }
///     var $refreshSec: ClosedRange<Int> { _refreshSec.projectedValue }
///
/// Kotlin `lazy` ↔ Swift `lazy var`;  Delegates.observable ↔ `didSet` / `willSet`.
/// Class delegation `: I by inner` does NOT exist in Swift → you have to forward each member by hand.
enum PropertyWrapperDemo {
    @propertyWrapper
    struct Clamped<Value: Comparable> {
        private var value: Value
        let range: ClosedRange<Value>

        init(wrappedValue: Value, _ range: ClosedRange<Value>) {
            self.range = range
            self.value = min(max(wrappedValue, range.lowerBound), range.upperBound)
        }

        var wrappedValue: Value {
            get { value }
            set { value = min(max(newValue, range.lowerBound), range.upperBound) }
        }

        var projectedValue: ClosedRange<Value> { range }   // accessed via $name
    }

    final class AdSettings {
        var changes: [String] = []

        @Clamped(15...120) var refreshSec: Int = 30

        var floorUSD: Double = 0 {
            didSet { changes.append("didSet: floorUSD \(oldValue) → \(floorUSD)") }
        }

        lazy var heavyConfig: String = {
            changes.append("lazy: computed only once, on first access")
            return "config-loaded"
        }()
    }

    // Manual forwarding — what Kotlin's `by inner` does for you
    final class LoggingNetwork: ProtocolDemo.AdNetwork {
        private let inner: any ProtocolDemo.AdNetwork
        private(set) var log: [String] = []
        init(_ inner: any ProtocolDemo.AdNetwork) { self.inner = inner }

        var name: String { inner.name }                 // forward
        var priority: Int { inner.priority }            // forward
        func load(unitId: String) -> EnumDemo.AdLoadResult {
            log.append("→ \(inner.name).load(\(unitId))")
            let result = inner.load(unitId: unitId)
            log.append("← \(EnumDemo.render(result))")
            return result
        }
    }

    static func run() -> [String] {
        var out: [String] = []
        let settings = AdSettings()
        settings.refreshSec = 5
        out.append("refreshSec = 5 → \(settings.refreshSec)   // clamped to 15")
        settings.refreshSec = 999
        out.append("refreshSec = 999 → \(settings.refreshSec)   // clamped to 120")
        out.append("$refreshSec (projectedValue) = \(settings.$refreshSec)")
        settings.floorUSD = 0.8
        _ = settings.heavyConfig
        _ = settings.heavyConfig
        out += settings.changes

        let network = LoggingNetwork(ProtocolDemo.AdMobNetwork())
        _ = network.load(unitId: "inter_level_end")
        out += network.log
        return out
    }
}
