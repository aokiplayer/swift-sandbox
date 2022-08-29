import SwiftUI

struct ExampleAppStorage: View {
    // UserDefaults を利用する Property Wrapper
    // 値の変更時に、ビューを更新する
    @AppStorage("lastMessage") private var lastMessage: String = "\(dateFormatter.string(from: Date.now)))"

    // シーンごとに値を保持する Property Wrapper
    // Split View で確認すると、独立して値が管理されているのがわかる
    // アプリ終了でクリアされる？
    @SceneStorage("number") private var number: Int = 0
    
    @Environment(\.dismiss) private var dismiss: DismissAction
    
    @State private var isModalPresented: Bool = false
    
    var body: some View {
        VStack {
            Text("AppStorage の利用")
                .font(.title)
            
            VStack(alignment: .leading) {
                Text("AppStorage: \(lastMessage)")
                
                Text("SceneStorage: \(number)")
            }
            .font(.headline)
            .padding()

            Button {
                isModalPresented.toggle()
                
                // AppStorage, SceneStorage のデータを更新
                lastMessage = "\(dateFormatter.string(from: Date.now))"
                number += 1
            } label: {
                Label("Next", systemImage: "arrow.forward")
                    .symbolRenderingMode(.multicolor)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .frame(width: 200, height: 56)
            .fullScreenCover(isPresented: $isModalPresented, onDismiss: {
                // AppStorage, SceneStorage のデータを更新
                lastMessage = "\(dateFormatter.string(from: Date.now))"
                number += 1
            }) {
                SecondView(lastMessage: $lastMessage, number: $number)
            }
        }
        .padding()
    }
}

struct SecondView: View {
    @Environment(\.dismiss) private var dismiss: DismissAction
    
    @Binding var lastMessage: String
    @Binding var number: Int
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("AppStorage: \(lastMessage)")
                
                Text("SceneStorage: \(number)")
            }
            .font(.headline)
            .padding()

            Button {
                dismiss()
            } label: {
                Label("Back", systemImage: "arrow.backward")
                    .symbolRenderingMode(.multicolor)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .frame(width: 200, height: 56)
        }
    }
}

fileprivate let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    formatter.timeZone = .current
    formatter.locale = Locale(identifier: "ja_JP")

    return formatter
}()

struct Example_AppStorage_Previews: PreviewProvider {
    static var previews: some View {
        ExampleAppStorage()
    }
}
