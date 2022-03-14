import SwiftUI

struct ContentView: View {
    // body は常に単一のビューを返すように定義する
    var body: some View {
        /*
         以下のコメントを切り替えて確認しましょう
         */
        // 別のファイルで定義したビューを表示
//        ExampleText()
        ExampleList1()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
