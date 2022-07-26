import SwiftUI

struct ExampleAlert1: View {
    // アラートダイアログの表示を制御する State
    @State var isAlertShown: Bool

    var body: some View {
        VStack {
            Button {
                // ボタンをタップしたら State を更新
                isAlertShown.toggle()
            } label: {
                Label("Show Alert", systemImage: "bubble.right")
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .symbolRenderingMode(.multicolor)
            }
            .buttonStyle(.borderedProminent)
            .frame(width: 200, height: 56)
            // State の値をもとにダイアログを表示
            .alert("Hello", isPresented: $isAlertShown) {
                Button("OK") {
                    print("OK が押されたよ。")
                }
            } message: {
                Text("OK をタップしたら閉じます。")
            }
        }
    }
}

struct Example_Alert1_Previews: PreviewProvider {
    static var previews: some View {
        ExampleAlert1(isAlertShown: false)
    }
}
