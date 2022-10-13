import SwiftUI

struct ExampleToolbar2: View {
    @State private var inputText: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("ToolbarContentBuilder の利用")
                    .font(.title)
                
                TextField("入力", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                    .focused($isFocused)
            }
            // ToolbarContentBuilder を利用して作成したツールバーを配置
            .toolbar(content: toolbarContent)
            .padding()
        }
    }
}

extension ExampleToolbar2 {
    // Toolbar を関数として切り出したもの
    @ToolbarContentBuilder
    fileprivate func toolbarContent() -> some ToolbarContent {
        // ToolbarItem には、それぞれ配置場所を指定可能
        ToolbarItem(placement: .primaryAction) {
            Button {
                print("Tapped.")
            } label: {
                Label("Add", systemImage: "folder.badge.plus")
            }
        }
        
        ToolbarItem(placement: .bottomBar) {
            Text(Date.now.formatted(.dateTime))
        }
        
        // ToolbarItemGroup を使うことで、複数の View を利用したツールバーを作成できる
        // placement に .keyboard を指定すると、オンスクリーンキーボードの上部表示される
        ToolbarItemGroup(placement: .keyboard) {
            Spacer()

            // キーボードを閉じるボタンを配置
            Button {
                isFocused.toggle()
            } label: {
                Text("Done")
            }
        }
    }
}

struct Example_Toolbar2_Previews: PreviewProvider {
    static var previews: some View {
        ExampleToolbar2()
    }
}
