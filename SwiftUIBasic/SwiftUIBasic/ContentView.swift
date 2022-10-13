import SwiftUI

struct ContentView: View {
    // body は常に単一のビューを返すように定義する
    var body: some View {
        NavigationStack {
            List(views, id: \.title) { element in
                row(value: element)
                    .padding()
            }
            .navigationTitle("SwiftUI サンプル")
        }
    }
    
    private func row(value: RowValue) -> some View {
        NavigationLink {
            value.view
        } label: {
            HStack {
                VStack(alignment: .leading) {
                    Label(value.title, systemImage: "iphone")
                        .font(.title2)
                    
                    Text(value.note)
                        .font(.caption)
                        .padding(.top, 8)
                }
            }
        }
    }
}

typealias RowValue = (title: String, view: AnyView, note: String)

// ビューを配列に持たせる場合は、AnyView にラップして型消去する必要あり
// some View 型だと、実際の型情報を保持しているため？
fileprivate var views: [RowValue] = [
    ("Text", AnyView(ExampleText()), ""),
    ("VStack", AnyView(ExampleVStack()), ""),
    ("HStack", AnyView(ExampleHStack()), ""),
    ("ZStack", AnyView(ExampleZStack()), ""),
    ("List", AnyView(ExampleList1()), ""),
    ("List2", AnyView(ExampleList2()), ""),
    ("Modal", AnyView(ExampleModal()), ""),
    ("SafariVC", AnyView(ExampleSafariVC()), ""),
    ("Label", AnyView(ExampleLabel()), ""),
    ("Group", AnyView(ExampleGroup()), ""),
    ("TimelineView", AnyView(ExampleTimelineView()), ""),
    ("Preview1", AnyView(ExamplePreview1()), "プレビューのサイズを指定しているため、個別のビューファイルで確認してください。"),
    ("Preview2", AnyView(ExamplePreview2()), "プレビューのサイズを指定しているため、個別のビューファイルで確認してください。"),
    ("AttributedString", AnyView(ExampleAttributedString()), ""),
    ("NavigationStack1", AnyView(ExampleNavigationStack1()), ""),
    ("NavigationStack2", AnyView(ExampleNavigationStack2()), ""),
    ("Alert1", AnyView(ExampleAlert1(isAlertShown: false)), ""),
    ("Alert2", AnyView(ExampleAlert2(isAlertShown: false)), ""),
    ("Alert3", AnyView(ExampleAlert3()), ""),
    ("Binding", AnyView(ExampleBinding()), ""),
    ("Font", AnyView(ExampleFont()), ""),
    ("Observe1", AnyView(ExampleObserve1(person: Person(name: "山田二郎", age: 53))), ""),
    ("Observe2", AnyView(ExampleObserve2()), ""),
    ("EnvironmentObject", AnyView(ExampleEnvironmentObject()
        .environmentObject(
            MyAppColors(myBackgroundColor: .gray,
                        myFontColor: .blue))), ""),
    ("StateAndObserved", AnyView(ExampleStateAndObserved()), ""),
    ("Environment", AnyView(ExampleEnvironment()
        .environment(\.locale, Locale(identifier: "ja_JP"))
        .environment(\.colorScheme, .dark)), ""),
    ("AppStorage", AnyView(ExampleAppStorage()), ""),
    ("Geometry1", AnyView(ExampleGeometry1()), ""),
    ("TextField", AnyView(ExampleTextField()
        .environment(\.locale, Locale(identifier: "ja_JP"))), ""),
    ("Toolbar1", AnyView(ExampleToolbar1()), "")
]

// AnyView の配列を List で繰り返すので、Identifiable に準拠
extension AnyView: Identifiable {
    public typealias ID = UUID

    public var id: UUID {
        UUID()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
