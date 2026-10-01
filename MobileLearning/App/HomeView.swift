import SwiftUI

/// Home screen: the list of lessons. Tap a lesson to view and run its demos.
struct HomeView: View {
    var body: some View {
        NavigationStack {
            List(Lessons.all) { lesson in
                NavigationLink {
                    LessonView(lesson: lesson)
                } label: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Lesson \(lesson.number) · \(lesson.title)").font(.headline)
                        Text(lesson.summary).font(.caption).foregroundStyle(.secondary)
                        Text("\(lesson.demos.count) demo").font(.caption2).foregroundStyle(.tertiary)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Mobile Learning")
        }
    }
}

struct LessonView: View {
    let lesson: Lesson

    var body: some View {
        List(lesson.demos) { demo in
            DemoRow(demo: demo)
        }
        .navigationTitle("Lesson \(lesson.number)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DemoRow: View {
    let demo: Demo
    @State private var output: [String]?

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("\(demo.id) · \(demo.title)").font(.headline)
            Text("Android: \(demo.counterpart)").font(.caption).foregroundStyle(.secondary)
            if let output {
                ForEach(Array(output.enumerated()), id: \.offset) { _, line in
                    Text(line).font(.system(.caption, design: .monospaced))
                }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation { output = output == nil ? demo.run() : nil }
        }
    }
}

#Preview {
    HomeView()
}
