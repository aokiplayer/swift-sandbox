import SwiftUI

@main
struct SwiftUIBasicApp: App {
    @StateObject var myAppColors: MyAppColors = MyAppColors(myBackgroundColor: .green,
                                                            myFontColor: .orange)
    
    var body: some Scene {
        WindowGroup {
            // ContentView 配下の全ての階層でモデルオブジェクトを共有
            ContentView()
                .environmentObject(myAppColors)
        }
    }
}

// このアプリ全体で利用するためのモデルクラス
class MyAppColors: ObservableObject {
    @Published var myBackgroundColor: Color
    @Published var myFontColor: Color
    
    init(myBackgroundColor: Color, myFontColor: Color) {
        self.myBackgroundColor = myBackgroundColor
        self.myFontColor = myFontColor
    }
}
