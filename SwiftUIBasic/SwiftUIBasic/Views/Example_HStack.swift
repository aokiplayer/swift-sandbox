import SwiftUI

struct ExampleHStack: View {
    var body: some View {
        // HStack は左右にビューを並べる
        HStack(alignment: .center, spacing: 12) {
            Text("左から")
                .font(.headline)

            Image(systemName: "arrow.right.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)

            Text("順に表示されます")
                .font(.body)
        }
    }
}

struct ExampleHStack_Previews: PreviewProvider {
    static var previews: some View {
        ExampleHStack()
    }
}
