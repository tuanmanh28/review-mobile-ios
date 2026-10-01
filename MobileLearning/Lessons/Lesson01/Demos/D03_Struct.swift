/// 3. struct — a VALUE type
///
/// Assigning / passing as a parameter = COPYING (semantically). Changing the copy doesn't affect the original.
/// Array, String, Dictionary use Copy-on-Write: the buffer is only actually copied on write.
/// By contrast: a Kotlin data class is a REFERENCE type — assigning shares the same object.
enum StructDemo {
    struct AdConfig: Hashable {           // Equatable/Hashable are synthesized by the compiler
        var unitId: String
        var timeoutMs: Int = 3_000
        var tags: [String] = []
    }

    final class RefConfig {                // class = reference type, for comparison
        var timeoutMs = 3_000
    }

    static func run() -> [String] {
        var out: [String] = []
        let a = AdConfig(unitId: "banner_home")   // synthesized memberwise init
        out.append("a = \(a)")
        out.append("a == AdConfig(unitId: \"banner_home\") → \(a == AdConfig(unitId: "banner_home"))")

        var b = a                                   // COPY
        b.timeoutMs = 5_000
        b.tags.append("vip")
        out.append("var b = a; modify b → a.timeoutMs=\(a.timeoutMs), a.tags=\(a.tags)   // a is unchanged")
        // a.timeoutMs = 1                          // ❌ a is a let → the whole struct is immutable

        let r1 = RefConfig()
        let r2 = r1
        r2.timeoutMs = 5_000
        out.append("class: let r2 = r1; modify r2 → r1.timeoutMs=\(r1.timeoutMs), r1 === r2 → \(r1 === r2)")

        // Copy-on-Write
        let arr1 = [1, 2, 3]
        var arr2 = arr1
        out.append("COW: before writing, do arr1 & arr2 share a buffer? \(bufferAddress(arr1) == bufferAddress(arr2))")
        arr2.append(4)
        out.append("COW: after arr2.append(4), shared buffer? \(bufferAddress(arr1) == bufferAddress(arr2))")
        return out
    }

    static func bufferAddress(_ array: [Int]) -> UnsafeRawPointer? {
        array.withUnsafeBufferPointer { UnsafeRawPointer($0.baseAddress) }
    }
}
