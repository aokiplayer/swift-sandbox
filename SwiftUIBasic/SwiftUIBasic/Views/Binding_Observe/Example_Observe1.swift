import SwiftUI

struct ExampleObserve1: View {
    // モデルはビュー内でインスタンス化してはダメ
    // ビューはいつ破棄されて再生成されるかわからないため、状態が保持できなくなってしまう
    @ObservedObject var person: Person
    
    var body: some View {
        VStack {
            Text("モデルオブジェクトの利用")
                .font(.title)
            
            HStack {
                Text(person.name)
                
                // モデルの @Published なプロパティを利用
                // そのプロパティが更新されたら、ビューを再レンダリング
                Text("\(person.age)歳")
            }
            .padding()
            
            Button {
                withAnimation(.easeInOut) {
                    person.age += 1
                }
            } label: {
                Text("加齢")
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
class Person: ObservableObject {
    let name: String
    
    // ビューがモニタリングするプロパティには @Published を指定
    @Published var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

struct Example_Observe_Previews: PreviewProvider {
    static var previews: some View {
        ExampleObserve1(person: Person(name: "山田二郎", age: 53))
    }
}
