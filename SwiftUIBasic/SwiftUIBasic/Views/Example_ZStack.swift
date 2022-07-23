import SwiftUI

struct ExampleZStack: View {
    var body: some View {
        // ZStack は前後にビューを並べる（配置順に、後ろ -> 前）
        ZStack {
            Image(systemName: "bubble.left")
                .resizable()
                .aspectRatio(contentMode: .fit)
                // 自分の親（ここでは背景）いっぱいまで広げる
                .frame(width: .infinity)
                .foregroundColor(.mint)

            Text("Image の上に Text が表示されます")
                .font(.title)
                .padding([.leading, .bottom, .trailing], 48.0)
        }
        .padding(.horizontal)
    }
}

struct ExampleZStack_Previews: PreviewProvider {
    static var previews: some View {
        ExampleZStack()
    }
}
