// Exercise 4 — enum + associated values (see AdEvent in Models.swift)
// Rules: no default in your switch.

extension AdEvent {
    /// 4.1 impression → "ad_impression", click → "ad_click", loadFailed → "ad_load_failed", closed → "ad_closed"
    var logName: String {
        return "" // TODO: Ex04.1
    }
}

/// 4.2 Total USD revenue from impressions (revenueMicros / 1_000_000).
func totalRevenueUSD(_ events: [AdEvent]) -> Double {
    return -1 // TODO: Ex04.2
}

/// 4.3 Only retry for loadFailed with code 0 (internal) or 2 (network). Hint: if case
func shouldRetry(_ event: AdEvent) -> Bool {
    return false // TODO: Ex04.3
}
