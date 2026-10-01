/// 1. Optional
///
/// Swift: `String?` is just shorthand for `Optional<String>` — a real ENUM:
///
///     enum Optional<Wrapped> { case none; case some(Wrapped) }
///
/// Because it's a value type (not a pointer), `Int?` needs no boxing like in Kotlin:
/// it just adds a 1-byte "tag" to tell .none from .some. For types with "spare bits" (String, class refs)
/// Swift tucks the nil state into those bits → the size doesn't change.
enum OptionalDemo {
    struct Profile { var nickname: String? }
    struct Account { var profile: Profile? }

    static func run() -> [String] {
        var out: [String] = []
        let appName: String = "ReviewMobile"
        // let broken: String = nil          // ❌ 'nil' cannot initialize specified type 'String'
        let tag: String? = nil
        out.append("appName.count = \(appName.count)   // String: use it directly")

        // ?.  optional chaining
        out.append("tag?.count = \(String(describing: tag?.count))")

        // ??  nil-coalescing (≈ Kotlin's ?:)
        out.append("tag?.count ?? 0 = \(tag?.count ?? 0)")

        let account: Account? = Account(profile: Profile(nickname: nil))
        out.append("account?.profile?.nickname ?? \"Guest\" = \(account?.profile?.nickname ?? "Guest")")

        // if let / guard let  (≈ smart cast / ?.let)
        let email: String? = "user@example.com"
        if let email {                         // Swift 5.7+: shorthand for if let email = email
            out.append("if let: email.count = \(email.count)")
        }

        // Optional is an enum → you can switch / pattern match on it
        switch tag {
        case .none: out.append("switch tag → .none")
        case .some(let value): out.append("switch tag → .some(\(value))")
        }

        // map / flatMap on Optional (≈ ?.let { })
        out.append("email.map { $0.uppercased() } = \(email.map { $0.uppercased() } ?? "-")")

        // Force unwrap `!` — if it's wrong you CRASH; there's no exception to catch like in Kotlin
        out.append("tag! → Fatal error: Unexpectedly found nil  ⚠️ can't be caught with try/catch")

        // Under the hood: no boxing
        out.append("MemoryLayout<Int>.size  = \(MemoryLayout<Int>.size)")
        out.append("MemoryLayout<Int?>.size = \(MemoryLayout<Int?>.size)   // +1 byte tag, still on the stack")
        out.append("MemoryLayout<String>.size = \(MemoryLayout<String>.size), String? = \(MemoryLayout<String?>.size)   // uses spare bits")
        return out
    }
}
