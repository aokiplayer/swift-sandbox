import SwiftUI

struct ExampleVStack: View {
    var body: some View {
        // VStack は上下にビューを並べる
        VStack(spacing: 36) {
            Text("上から")
                .font(.headline)

            // Image は resizable() を呼び出さないと、元のサイズで固定される
            Image(systemName: "arrow.down.circle")
                .resizable()
                // .fit は縦横比を保ちつつ、全体が表示できるところまで広がる
                .aspectRatio(contentMode: .fit)
                // フレームサイズを設定
                .frame(width: 200, height: 80)

            Text("順に表示されます")
                .font(.body)
        }
    }
}

struct ExampleVStack_Previews: PreviewProvider {
    static var previews: some View {
        ExampleVStack()
    }
}
