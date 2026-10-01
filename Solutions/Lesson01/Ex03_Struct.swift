struct AdConfig: Hashable {
    var unitId: String
    var timeoutMs: Int = 3_000
    var refreshSec: Int = 30
    var testMode: Bool = false
}

extension AdConfig {
    func forTesting() -> AdConfig {
        var copy = self          // struct → this is an independent copy
        copy.testMode = true
        copy.timeoutMs = 10_000
        return copy
    }
}

func mergeUnique(_ configs: [AdConfig]) -> [AdConfig] {
    var seen = Set<AdConfig>()
    return configs.filter { seen.insert($0).inserted }
}

func describe(_ config: AdConfig) -> String {
    "unit=\(config.unitId), timeout=\(config.timeoutMs)ms"
}
