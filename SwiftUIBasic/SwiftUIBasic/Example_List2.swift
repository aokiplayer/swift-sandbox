import SwiftUI

struct ExampleList2: View {
    var body: some View {
        // List 内の各 View が 1 行を表す
        // ここでは HStack が 3 つ
        List {
            HStack {
                Image(systemName: "folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48)

                Text("最初の行")
                    .font(.headline)

                // Spacer は可能な限りスペースを空けるための部品
                Spacer()

                Text("これは説明文です。")
                    .font(.caption)
            }
            
            HStack {
                Text("これは 2 行目")
                    .font(.headline)
            }

            HStack {
                Text("3 行目")
                    .font(.headline)

                Spacer()

                Image(systemName: "hand.thumbsup")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.indigo)
                    .frame(width: 36)
                    // タップに反応して処理を実行できる
                    .onTapGesture {
                        print("タップされたよ！")
                    }
            }

            // Label はアイコン画像とテキストを組み合わせたもの
            Label("4 行目のラベル", systemImage: "lightbulb")
        }

    }
}

struct ExampleList2_Previews: PreviewProvider {
    static var previews: some View {
        ExampleList2()
    }
}
