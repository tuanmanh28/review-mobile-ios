extension AdEvent {
    var logName: String {
        switch self {
        case .impression: return "ad_impression"
        case .click: return "ad_click"
        case .loadFailed: return "ad_load_failed"
        case .closed: return "ad_closed"
        }
    }
}

func totalRevenueUSD(_ events: [AdEvent]) -> Double {
    let micros = events.reduce(Int64(0)) { sum, event in
        if case let .impression(_, revenueMicros) = event { return sum + revenueMicros }
        return sum
    }
    return Double(micros) / 1_000_000
}

func shouldRetry(_ event: AdEvent) -> Bool {
    if case let .loadFailed(_, code) = event { return code == 0 || code == 2 }
    return false
}
