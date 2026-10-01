/// 5. protocol + protocol extension
///
/// A protocol extension provides default implementations (≈ default methods on a Kotlin interface).
/// ⚠️ DISPATCH TRAP:
///  - Functions DECLARED in the protocol (requirements) → dynamic dispatch via the witness table → calls the concrete type's version.
///  - Functions that ONLY exist in an extension (not requirements) → static dispatch based on the variable's declared type.
/// Kotlin doesn't have this trap: every interface function is dynamically dispatched.
enum ProtocolDemo {
    protocol AdNetwork {
        var name: String { get }
        var priority: Int { get }                      // requirement
        func load(unitId: String) -> EnumDemo.AdLoadResult
    }

    struct AdMobNetwork: AdNetwork {
        let name = "AdMob"
        let priority = 10
        func load(unitId: String) -> EnumDemo.AdLoadResult { .loaded(network: name, ecpm: 1.4) }
    }

    struct MetaNetwork: AdNetwork {
        let name = "Meta"                              // priority uses the default = 0
        func load(unitId: String) -> EnumDemo.AdLoadResult { .noFill }
        func describe() -> String { "Meta Audience Network (custom describe)" }
    }

    static func run() -> [String] {
        var out: [String] = []
        let networks: [any AdNetwork] = [MetaNetwork(), AdMobNetwork()]
        for network in networks {
            out.append("(\(network.name) as any AdNetwork).describe() = \(network.describe())")
        }
        out.append("MetaNetwork().describe() = \(MetaNetwork().describe())")
        out.append("⚠️ describe() isn't a requirement → a variable of type `any AdNetwork` calls the extension's version")

        let sorted = networks.sorted { $0.priority > $1.priority }
        out.append("Waterfall by priority: \(sorted.map(\.name).joined(separator: " → "))")
        for network in sorted {
            out.append("\(network.name).load() = \(EnumDemo.render(network.load(unitId: "home")))")
        }
        return out
    }
}

extension ProtocolDemo.AdNetwork {
    var priority: Int { 0 }                                          // default for a requirement
    func describe() -> String { "\(name) (priority=\(priority))" }   // NOT a requirement
}
