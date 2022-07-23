import SwiftUI

struct ExampleTimelineView: View {
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "ja_JP")
        
        return formatter
    }()
    
    var body: some View {
        VStack {
            Text("TimelineView")
                .font(.title)

            VStack {
                Label("1 分ごとに更新", systemImage: "clock.arrow.circlepath")
                    .font(.title2)
                
                // .everyMinute は 1 分ごとに更新
                TimelineView(.everyMinute) { content in
                    Text(formatter.string(from: content.date))
                }
            }
            .padding()
            
            VStack {
                Label("5 秒ごとに更新", systemImage: "clock.arrow.circlepath")
                    .font(.title2)
                
                // FIXME: 開始日時が無視されて、すぐに実行開始されちゃう？
                // .periodic は開始日時とインターバルを指定
                TimelineView(.periodic(from: .init() + (60 * 60 * 24 * 5), by: 5)) { content in
                    Text(formatter.string(from: content.date))
                }
            }
            .padding()
        }
    }
}

struct Example_TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleTimelineView()
    }
}
