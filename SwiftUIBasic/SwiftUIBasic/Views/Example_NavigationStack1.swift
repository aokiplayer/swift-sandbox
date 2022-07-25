import SwiftUI

struct ExampleNavigationStack1: View {
    var body: some View {
        // NavigationStack で、画面のスタックを管理
        NavigationStack {
            // リンク先と、label ではリンク元のビューを指定
            NavigationLink {
                Text("Hello")
                    .font(.title)
            } label: {
                Label("Navigation", systemImage: "arrow.forward.square.fill")
                    .font(.title)
            }
            .navigationTitle("ナビゲーション")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct Example_NavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        ExampleNavigationStack1()
    }
}
