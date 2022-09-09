import SwiftUI

struct ExampleObserve2: View {
    // 基本は @ObservedObject と同じだけど、ビュー内で初期化しても状態を保持できる
    // ビューの再生成を経ても値が保持される
    @StateObject private var product: Product = .init(name: "MacBook Pro", price: 300_000)
    
    var body: some View {
        VStack {
            Text("StateObject の利用")
                .font(.title)
            
            HStack {
                Text(product.name)
                                
                // モデルの @Published なプロパティを利用
                // そのプロパティが更新されたら、ビューを再レンダリング
                Text("¥\(product.price)")
            }
            .padding()
            
            Button {
                withAnimation(.easeInOut) {
                    product.price += 500
                }
            } label: {
                Text("値上げ")
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .frame(width: 200, height: 48)
        }
        .padding()
    }
}

// モデルデータとして扱うには、ObservableObject に準拠
class Product: ObservableObject {
    let name: String

    // ビューがモニタリングするプロパティには @Published を指定
    @Published var price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}

struct Example_Observe2_Previews: PreviewProvider {
    static var previews: some View {
        ExampleObserve2()
    }
}
