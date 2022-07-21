import SwiftUI

struct ExampleGroup: View {
    var body: some View {
        HStack {
            VStack {
                Text("ABCD")
                Text("EFGH")
                Text("IJKL")
            }
            .font(.headline)
            .foregroundColor(.cyan)
            .padding()  // VStack 自体に padding が適用される
            
            // Group は、レイアウトをせずにビューをまとめる
            // modifier は、中の各ビューに適用される（この例だと padding）
            // HStack や VStack はレイアウトをするけど、Group はしない
            Group{
                Text("MNOP")
                Text("QRST")
                Text("UVWX")
            }
            .font(.headline)
            .foregroundColor(.indigo)
            .padding()  // Group 内の各ビューに padding が適用される
        }
    }
}

struct Example_Group_Previews: PreviewProvider {
    static var previews: some View {
        ExampleGroup()
    }
}
