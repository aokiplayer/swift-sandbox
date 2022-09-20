import SwiftUI

struct ExampleCellView: View {
    var name: String
    
    var body: some View {
        HStack {
            Image(systemName: "iphone")
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title2)
                Text("World")
                    .font(.caption)
            }
        }
    }
}

struct ExampleCellView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleCellView(name: "Test")
            .previewLayout(.sizeThatFits)
    }
}
