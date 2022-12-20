import SwiftUI

struct ExampleGrid: View {
    var body: some View {
        VStack {
            Text("iPhone")
                .font(.largeTitle)
                .padding()
            
            // グリッドを作成（各行の縦方向は下揃え）
            Grid(alignment: .bottom) {
                // 1 行目
                GridRow {
                    Text("with Home button")
                    Text("with Face ID")
                    Text("with Dynamic Island")
                }
                .font(.headline)
                .padding(.bottom)

                // 2 行目
                GridRow {
                    Image(systemName: "iphone.gen1")
                        .resizable()

                    Image(systemName: "iphone.gen2")
                        .resizable()
                    
                    Image(systemName: "iphone.gen3")
                        .resizable()
                }
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                
                Divider()
                
                // 3 行目
                GridRow {
                    Text("2007")
                    Text("2017")
                    Text("2022")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(CGSize(width: 5, height: 1), contentMode: .fit)
                .foregroundColor(.white)
                .background(.teal)
            }
        }
        .symbolRenderingMode(.multicolor)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

struct ExampleGrid_Previews: PreviewProvider {
    static var previews: some View {
        ExampleGrid()
    }
}
