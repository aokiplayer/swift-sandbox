import SwiftUI

struct ExampleLabel: View {
    var body: some View {
        // Label はタイトルとアイコンの組み合わせ
        Label("Hello", systemImage: "paintpalette")
            .font(.title)
            .symbolRenderingMode(.multicolor)
            .foregroundColor(.mint)
            .background(content: {
                Rectangle()
                    .fill(.yellow)
                    .opacity(0.2)
            })
            .border(.cyan, width: 2.0)
            .shadow(color: .indigo, radius: 0.2)
    }
}

struct Example_Label_Previews: PreviewProvider {
    static var previews: some View {
        ExampleLabel()
    }
}
