import SwiftUI

struct ExampleGeometry1: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("ビューのサイズと座標")
                .font(.title)
            
            Text("(x, y, width, height)")
                .font(.headline)
            
            // GeometryReader のクロージャ内で、ビューのサイズと座標が取得できる
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(.teal)

                        // .global は、UIView の frame と同様
                        // なので、座標は最上位ビューの左上が (0, 0)
                        Text("""
                         global（最上位ビューからの相対）:
                         \(geometry.frame(in: .global).debugDescription)
                         """)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(.red, width: 5)
                    }
                    .frame(width: 300, height: 200)
                    
                    ZStack {
                        Rectangle()
                            .fill(.orange)
                        
                        // .local は、UIView の bounds と同様
                        // なので、座標は自身の左上が (0, 0)
                        Text("""
                         local（自身のビューのローカル）:
                         \(geometry.frame(in: .local).debugDescription)
                         """)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .border(.blue, width: 5)
                    }
                    .frame(width: 250, height: 200)
                }
                .border(.gray, width: 3)
            }
            .padding()
        }
    }
}

struct Example_Geometry1_Previews: PreviewProvider {
    static var previews: some View {
        ExampleGeometry1()
    }
}
