enum Lesson01 {
    static let lesson = Lesson(
        number: 1,
        title: "Language · Swift ↔ Kotlin",
        summary: "Optional, extension, struct, enum, protocol, property wrapper, generic some/any",
        demos: [
            Demo(id: "D01", title: "Optional", counterpart: "nullable type", run: OptionalDemo.run),
            Demo(id: "D02", title: "extension", counterpart: "extension function", run: ExtensionDemo.run),
            Demo(id: "D03", title: "struct", counterpart: "data class", run: StructDemo.run),
            Demo(id: "D04", title: "enum + associated value", counterpart: "sealed class", run: EnumDemo.run),
            Demo(id: "D05", title: "protocol + protocol extension", counterpart: "interface", run: ProtocolDemo.run),
            Demo(id: "D06", title: "property wrapper", counterpart: "delegation", run: PropertyWrapperDemo.run),
            Demo(id: "D07", title: "Optional.map, if let, closure", counterpart: "scope function", run: ScopeDemo.run),
            Demo(id: "D08", title: "generic, some / any", counterpart: "generic", run: GenericsDemo.run),
        ]
    )
}
