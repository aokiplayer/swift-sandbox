import SwiftUI

struct ExampleToolbar1: View {
    @State private var inputText: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("ToolBar の配置")
                    .font(.title)
                
                TextField("入力", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                    .focused($isFocused)
            }
            // toolbar modifier で、ツールバーを配置
            .toolbar {
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
            .padding()
        }
    }
}

struct Example_Toolbar1_Previews: PreviewProvider {
    static var previews: some View {
        ExampleToolbar1()
    }
}
