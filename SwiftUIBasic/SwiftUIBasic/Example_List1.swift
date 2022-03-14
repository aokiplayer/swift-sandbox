import SwiftUI

struct ExampleList1: View {
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
                
                Button {
                    print("ボタンがタップされたよ！")
                } label: {
                    Image(systemName: "hand.thumbsup")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.indigo)
                        .frame(width: 36)
                }
                // FIXME: このスタイルじゃないと、セルがタップに反応してしまう
                // https://qiita.com/yimajo/items/f63d38edd4597b97835a
                .buttonStyle(.borderless)
            }
        }
    }
}

struct ExampleList1_Previews: PreviewProvider {
    static var previews: some View {
        ExampleList1()
    }
}
