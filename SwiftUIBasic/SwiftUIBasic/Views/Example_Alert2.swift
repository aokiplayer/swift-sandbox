import SwiftUI

struct ExampleAlert2: View {
    @State var isAlertShown: Bool
    @State var inputText: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("アラート 2")
                    .font(.title)
                
                HStack {
                    Text("入力内容: ")
                    Text(inputText)
                }
                
                TextField("入力", text: $inputText)
                    .border(.gray)
            }
            .padding()

            Button {
                isAlertShown.toggle()
            } label: {
                Label("ShowAlert", systemImage: "bubble.right")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .frame(width: 200, height: 56)
            .padding()
            // Destructive ボタンと Cencel ボタンを持ったアラートダイアログ
            .alert("入力値削除", isPresented: $isAlertShown) {
                // ここで、ダイアログに並べるボタンを配置する
                Button("削除", role: .destructive) {
                    inputText = ""
                }
                
                Button("キャンセル", role: .cancel) {
                    // 処理なし
                }
            } message: {
                Text("入力値を削除しますか？")
            }
            .padding()
        }
    }
}

struct Example_Alert2_Previews: PreviewProvider {
    static var previews: some View {
        ExampleAlert2(isAlertShown: false)
    }
}
