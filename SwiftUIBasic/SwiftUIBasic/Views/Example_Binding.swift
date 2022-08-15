import SwiftUI

struct ExampleBinding: View {
    // スイッチの状態
    // 子ビューに共有する場合は、子ビュー側のプロパティは @Binding である必要あり
    @State private var isSwitchOn: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            Text("Binding のサンプル")
                .font(.title)

            // 子ビューに対し、自身の「状態」を渡す
            SwitchStatusView(isSwitchOn: $isSwitchOn)

            Button {
                // 状態を切り替え
                isSwitchOn.toggle()
            } label: {
                Label("切り替え", systemImage: "hand.point.up")
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .frame(width: 200, height: 48)
            
            Spacer()
        }
        .padding()
    }
}

struct SwitchStatusView: View {
    // 親ビューのプロパティを参照（自身で値は持たない）
    @Binding var isSwitchOn: Bool

    var body: some View {
        Image(systemName: isSwitchOn ? "lightswitch.on.square" : "lightswitch.off.square")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 120)
            .symbolRenderingMode(.multicolor)
            .foregroundStyle(.green)
            .padding()
    }
}

struct Example_Binding_Previews: PreviewProvider {
    static var previews: some View {
        ExampleBinding()
    }
}
