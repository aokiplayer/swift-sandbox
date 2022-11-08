import SwiftUI

struct ExampleAnimation1: View {
    @State private var textPosition: CGPoint = .zero
    @State private var textColor: Color = .indigo
    @State private var textBackgroundColor: Color = .yellow
    
    var body: some View {
        VStack {
            Text("アニメーション")
                .font(.title)
            Text("Animation")
                .frame(width: 200, height: 80)
                .font(.title)
                .bold()
                .foregroundColor(textColor)
                .background(textBackgroundColor)
                .gesture(
                    TapGesture().onEnded {
                        // textColor の変化だけ、アニメーションする
                        withAnimation(.linear(duration: 2.0)) {
                            textColor = .white
                        }
                        
                        // こっちはアニメーションしない
                        textBackgroundColor = .green
                    }
                )
            Button("元に戻す") {
                textColor = .indigo
                textBackgroundColor = .yellow
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}

struct ExampleAnimation1_Previews: PreviewProvider {
    static var previews: some View {
        ExampleAnimation1()
    }
}
