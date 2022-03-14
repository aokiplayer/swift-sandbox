import SwiftUI

struct ExampleModal: View {
    @State private var showModal: Bool = false

    var body: some View {
        Button {
            showModal = true
        } label: {
            Text("モーダル画面を表示")
        }
        .sheet(isPresented: $showModal) {
            // 次の画面（View を表示）
            // 表示するのはどんな View でも OK（別ファイルに作成した画面など）
            Text("モーダル画面")
        }

    }
}

struct ExampleModal_Previews: PreviewProvider {
    static var previews: some View {
        ExampleModal()
    }
}
