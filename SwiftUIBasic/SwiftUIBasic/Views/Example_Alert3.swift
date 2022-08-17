import SwiftUI

struct ExampleAlert3: View {
    @State private var message: String = ""
    @State private var isAlertPresented: Bool = false
    
    var body: some View {
        VStack {
            Text("Alert with TextField")
                .font(.title)
            
            Text(message)
                .font(.headline)
                .padding()
                .frame(width: 200, height: 48)
                .border(.red)
            Button {
                isAlertPresented.toggle()
            } label: {
                Label("Show dialog", systemImage: "hand.point.up")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .frame(width: 200, height: 48)
            // アラートダイアログ上の TextField は iOS 16 から置けるようになった
            .alert("テキストフィールド付き", isPresented: $isAlertPresented) {
                TextField("文字を入力", text: $message)

                Button(action: {}) {
                    Text("OK")
                }

                Button(role: .cancel) {
                    message = ""
                } label: {
                    Text("Cancel")
                }
            } message: {
                Text("iOS 16 から利用可能")
            }
        }
    }
}

struct Example_Alert3_Previews: PreviewProvider {
    static var previews: some View {
        ExampleAlert3()
    }
}
