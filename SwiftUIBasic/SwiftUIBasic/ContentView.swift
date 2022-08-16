import SwiftUI

struct ContentView: View {
    // body は常に単一のビューを返すように定義する
    var body: some View {
        /*
         以下のコメントを切り替えて確認しましょう
         */
        // 別のファイルで定義したビューを表示
//        ExampleText()
//        ExampleVStack()
//        ExampleHStack()
//        ExampleZStack()
//        ExampleList1()
//        ExampleList2()
//        ExampleModal()
//        ExampleSafariVC()
//        ExampleLabel()
//        ExampleGroup()
//        ExampleTimelineView()
//        ExamplePreview1()
//        ExamplePreview2()
//        ExampleAttributedString()
//        ExampleNavigationStack1()
//        ExampleNavigationStack2()
//        ExampleAlert1(isAlertShown: false)
//        ExampleAlert2(isAlertShown: false)
//        ExampleBinding()
//        ExampleFont()
//        ExampleObserve1(person: Person(name: "山田二郎", age: 53))
//        ExampleObserve2()
//        ExampleEnvironmentObject()
//            .environmentObject(MyAppColors(myBackgroundColor: .gray, myFontColor: .blue))
//        ExampleStateAndObserved()
        ExampleEnvironment()
            .environment(\.locale, Locale(identifier: "ja_JP"))
            .environment(\.colorScheme, .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
