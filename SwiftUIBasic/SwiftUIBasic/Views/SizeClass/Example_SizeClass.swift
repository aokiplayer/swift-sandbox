import SwiftUI

struct ExampleSizeClass: View {
    // 水平方向のサイズクラス（compact, regular のいずれか）
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    var body: some View {
        // compact なら VStackLayout, regular なら HStackLayout を生成
        // VStackLayout, HStackLayout は Layout プロトコルに準拠しているので、AutoLayout で型消去できる
        let layout = horizontalSizeClass == .compact ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
 
        // 上で選択したレイアウトを利用してビューを配置
        layout {
            Text("A")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.green)
                .foregroundColor(.white)

            Text("B")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.orange)
                .foregroundColor(.white)
        }
        .font(.largeTitle)
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct ExampleSizeClass_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // horizontalSizeClass が compact のデバイスでプレビュー（VStackLayout を利用）
            ExampleSizeClass()
                .previewDevice(.init(rawValue: "iPhone 14"))
                .previewDisplayName("w:Compact")

            // horizontalSizeClass が Regular のデバイスでプレビュー（HStackLayout を利用）
            ExampleSizeClass()
                .previewDevice(.init(rawValue: "iPad Pro (11-inch) (4th generation)"))
                .previewDisplayName("w:Regular")
        }
    }
}
