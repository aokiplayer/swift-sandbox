import SwiftUI

struct ExampleStateAndObserved: View {
    @State private var backgroundColor: Color = .yellow
    
    var body: some View {
        
        ZStack {
            // モニターしている状態変更時にビューが再生成される
            // -> 子ビューである MyCounterView も再生成される
            backgroundColor
            
            VStack {
                MyCounterView(name: "カウンターA")

                MyCounterView(name: "カウンターB")
                
                Button {
                    backgroundColor = (backgroundColor == .yellow) ? .orange : .yellow
                } label: {
                    Text("背景色変更")
                        .font(.headline)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .ignoresSafeArea()
    }
}

struct MyCounterView: View {
    // ここは @StateObject にしないと、親ビューが再生成された際にリセットされる
    @ObservedObject private var counter: MyCounter = MyCounter(
        name: "カウンター",
        count: 0)
    
    init(name: String) {
        self.counter.name = name
    }
    
    var body: some View {
        HStack {
            Text("\(counter.name): \(counter.count)")
            
            Button {
                counter.count += 1
            } label: {
                Text("カウントアップ")
                    .font(.headline)
            }
            .buttonStyle(.borderedProminent)

        }
        .padding()
    }
}

fileprivate class MyCounter: ObservableObject {
    var name: String
    @Published var count: Int
    
    init(name: String, count: Int) {
        self.name = name
        self.count = count
    }
}

struct Example_StateAndObserved_Previews: PreviewProvider {
    static var previews: some View {
        ExampleStateAndObserved()
    }
}
