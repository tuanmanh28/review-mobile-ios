import Foundation

struct AdRequest: Equatable {
    var unitId = ""
    var keywords: [String] = []
    var testMode = false
}

func configured<T>(_ value: T, _ update: (inout T) -> Void) -> T {
    var copy = value
    update(&copy)
    return copy
}

func buildRequest(unitId: String, keywords: [String]) -> AdRequest {
    configured(AdRequest()) {
        $0.unitId = unitId
        $0.keywords.append(contentsOf: keywords)
        $0.testMode = true
    }
}

func normalizeKeyword(_ raw: String?) -> String? {
    raw.map { $0.trimmingCharacters(in: .whitespaces).lowercased() }
        .flatMap { $0.isEmpty ? nil : $0 }
}
