import SwiftUI

struct ExampleNavigationStack2: View {
    var body: some View {
        // ナビゲーションで管理する範囲を NavigationStack で指定
        NavigationStack {
            // 繰り返す項目が Identifiable でない場合、識別するための id が必要
            List(users, id: \.userName) { user in
                // NavigationLink で、各行を選択した際の画面遷移を設定
                NavigationLink {
                    // 遷移先（スタックに積み上げる画面）
                    Text(user.userName)
                } label: {
                    // 遷移元のリンク部分（この行をタップしたら画面遷移）
                    HStack(alignment: .center) {
                        Label(user.userName, systemImage: "person.circle")
                        Spacer()
                        Text("\(user.age) 歳")
                    }
                    .padding()
                }
            }
            .navigationTitle("ナビゲーション")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct Example_NavigationStack2_Previews: PreviewProvider {
    static var previews: some View {
        ExampleNavigationStack2()
    }
}

// リストに表示するデータ
fileprivate struct User {
    let userName: String
    let age: Int
    let hobby: String
}

fileprivate let users: [User] = [
    .init(userName: "山田二郎", age: 53, hobby: "登山"),
    .init(userName: "川田吾郎", age: 27, hobby: "魚釣り"),
    .init(userName: "竹下九郎", age: 98, hobby: "竹細工"),
    .init(userName: "里田舞", age: 33, hobby: "野球観戦"),
    .init(userName: "海田泳", age: 16, hobby: "海水浴"),
    .init(userName: "土田潜太郎", age: 65, hobby: "モグラ取り"),
    .init(userName: "空野飛三郎", age: 29, hobby: "海外旅行"),
    .init(userName: "水谷飲三", age: 4, hobby: "飲み"),
    .init(userName: "草野履子", age: 43, hobby: "靴の収集"),
    .init(userName: "雷鳴海", age: 41, hobby: "電子工作"),
    .init(userName: "風祭吹夫", age: 22, hobby: "うちわ集め"),
    .init(userName: "長壁板之助", age: 52, hobby: "DIY"),
]
