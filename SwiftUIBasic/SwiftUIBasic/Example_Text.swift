import SwiftUI

struct ExampleText: View {
    var body: some View {
        Text("Hello, SwiftUI!")
            // ビューの Modifier で見た目など調整可能
            .font(.title)
            .foregroundColor(.indigo)
    }
}

struct ExampleText_Previews: PreviewProvider {
    static var previews: some View {
        ExampleText()
    }
}
