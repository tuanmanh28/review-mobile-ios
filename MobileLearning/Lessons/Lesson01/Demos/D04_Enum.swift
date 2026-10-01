/// 4. enum with associated values — the equivalent of Kotlin's sealed class
///
/// `switch` must be exhaustive: add a new case → the compiler flags every switch that doesn't handle it.
/// An enum is a value type; its size = the largest case + a tag.
enum EnumDemo {
    enum AdLoadResult {
        case loaded(network: String, ecpm: Double)
        case noFill
        case failed(code: Int, message: String)
    }

    static func render(_ result: AdLoadResult) -> String {
        switch result {                                   // no default needed
        case let .loaded(network, ecpm): return "✅ \(network) eCPM=\(ecpm)"
        case .noFill: return "∅ no fill"
        case let .failed(code, message): return "❌ [\(code)] \(message)"
        }
    }

    static func run() -> [String] {
        let results: [AdLoadResult] = [
            .loaded(network: "AdMob", ecpm: 1.25),
            .noFill,
            .failed(code: 2, message: "Network error"),
        ]
        var out = results.map(render)

        // if case: check a single case (≈ `is` + smart cast)
        if case let .failed(code, _) = results[2] {
            out.append("if case .failed(let code, _) → code = \(code)")
        }
        out.append("Try it: add `case timeout` → render() immediately fails to compile")
        return out
    }
}
