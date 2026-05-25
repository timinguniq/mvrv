import WidgetKit
import SwiftUI

private let appGroupId = "group.com.devjj.platform.mvrv"
private let keyMvrvZscore = "mvrv_zscore"

struct MvrvEntry: TimelineEntry {
    let date: Date
    let mvrvZscore: Double?
}

struct MvrvProvider: TimelineProvider {
    func placeholder(in context: Context) -> MvrvEntry {
        MvrvEntry(date: Date(), mvrvZscore: nil)
    }

    func getSnapshot(in context: Context, completion: @escaping (MvrvEntry) -> Void) {
        completion(MvrvEntry(date: Date(), mvrvZscore: loadZscore()))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MvrvEntry>) -> Void) {
        let entry = MvrvEntry(date: Date(), mvrvZscore: loadZscore())
        completion(Timeline(entries: [entry], policy: .never))
    }

    private func loadZscore() -> Double? {
        UserDefaults(suiteName: appGroupId)?.object(forKey: keyMvrvZscore) as? Double
    }
}

struct MvrvWidgetView: View {
    let entry: MvrvEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("MVRV Z-Score")
                .font(.caption)
                .foregroundColor(.secondary)
            if let zscore = entry.mvrvZscore {
                Text(String(format: "%.2f", zscore))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(zscoreColor(zscore))
            } else {
                Text("--")
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding()
        .containerBackground(.fill.tertiary, for: .widget)
    }

    private func zscoreColor(_ zscore: Double) -> Color {
        if zscore > 3.7 { return .red }
        if zscore < 1.0 { return .green }
        return .primary
    }
}

@main
struct MvrvWidget: Widget {
    let kind = "MvrvWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: MvrvProvider()) { entry in
            MvrvWidgetView(entry: entry)
        }
        .configurationDisplayName("MVRV Z-Score")
        .description("비트코인 MVRV Z-Score를 표시합니다.")
        .supportedFamilies([.systemSmall])
    }
}
