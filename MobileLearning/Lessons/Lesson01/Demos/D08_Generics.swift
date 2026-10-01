/// 8. Generics, `some` and `any`
///
/// - Swift does NOT erase types: `T` is known at runtime, and the compiler can also specialize
///   (generate a dedicated version for each concrete type) → as fast as hand-written code.
/// - `some P` (opaque type): "one fixed concrete type; the caller doesn't need to know which".
///   The compiler still knows → static dispatch, no extra allocation.  (SwiftUI: `var body: some View`)
/// - `any P` (existential): a "box" holding ANY type that conforms to P, swappable at runtime.
///   Box = 3-word buffer + metadata + witness table → dynamic dispatch, may allocate on the heap.
/// - associatedtype ≈ a protocol's generic parameter (Kotlin: interface Source<out T>).
enum GenericsDemo {
    protocol AdFormat { var name: String { get } }
    struct Banner: AdFormat { let name = "banner" }
    struct Interstitial: AdFormat { let name = "interstitial" }

    struct Slot<Format: AdFormat> {                    // constraint (≈ upper bound T : AdFormat)
        let format: Format
        func describe() -> String { "Slot<\(Format.self)>(\(format.name))" }
    }

    protocol Source {
        associatedtype Output
        func next() -> Output
    }
    struct BannerSource: Source {
        func next() -> Banner { Banner() }             // Output is inferred = Banner
    }

    static func maxOfTwo<T: Comparable>(_ a: T, _ b: T) -> T { a >= b ? a : b }

    static func typeName<T>(of _: [T]) -> String { "\(T.self)" }

    static func count<T: AdFormat>(of _: T.Type, in list: [any AdFormat]) -> Int {
        list.filter { $0 is T }.count                  // works because there's no erasure
    }

    static func makeDefaultFormat() -> some AdFormat { Banner() }

    static func run() -> [String] {
        var out: [String] = []
        let formats: [any AdFormat] = [Banner(), Banner(), Interstitial()]
        out.append("count(of: Banner.self) = \(count(of: Banner.self, in: formats))")
        out.append("maxOfTwo(3, 7) = \(maxOfTwo(3, 7)), maxOfTwo(\"a\", \"b\") = \(maxOfTwo("a", "b"))")
        out.append(Slot(format: Banner()).describe())
        out.append("No erasure: typeName([\"a\"]) = \(typeName(of: ["a"])), typeName([1]) = \(typeName(of: [1]))")

        let opaque = makeDefaultFormat()
        out.append("some AdFormat → \(opaque.name)   // the real type (Banner) is hidden from the caller")
        out.append("MemoryLayout<Banner>.size = \(MemoryLayout<Banner>.size)")
        out.append("MemoryLayout<any AdFormat>.size = \(MemoryLayout<any AdFormat>.size)   // existential box")

        let source = BannerSource()
        out.append("associatedtype: BannerSource().next().name = \(source.next().name)")
        return out
    }
}
