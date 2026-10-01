// Exercise 3 — struct (value type)

struct AdConfig: Hashable {
    var unitId: String
    var timeoutMs: Int = 3_000
    var refreshSec: Int = 30
    var testMode: Bool = false
}

extension AdConfig {
    /// 3.1 Return a COPY with testMode = true, timeoutMs = 10_000. Hint: var copy = self
    func forTesting() -> AdConfig {
        return self // TODO: Ex03.1
    }
}

/// 3.2 Remove configs with duplicate CONTENT, keeping first-occurrence order. Hint: a Set<AdConfig> to track what you've seen.
func mergeUnique(_ configs: [AdConfig]) -> [AdConfig] {
    return configs // TODO: Ex03.2
}

/// 3.3 Return "unit=<unitId>, timeout=<timeoutMs>ms"
func describe(_ config: AdConfig) -> String {
    return "" // TODO: Ex03.3
}
