import SwiftUI

struct ExamplePreview1: View {
    var body: some View {
        Label("単一デイバスでプレビュー", systemImage: "iphone")
            .font(.title)
            .imageScale(.large)
            .symbolRenderingMode(.multicolor)
    }
}

struct Example_Preview1_Previews: PreviewProvider {
    static var previews: some View {
        // 対象のデバイスを指定してプレビュー
        ExamplePreview1()
            // デバイスは xcrun simctl list devicetypes コマンドで確認可能
            .previewDevice(.init(rawValue: "iPhone 13 mini"))
            // プレビュー時に表示する名前
            .previewDisplayName("13 mini")
    }
}
