import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("モディファイアの順序")
                .font(.title)

            VStack {
                Text("frame -> border -> padding")
                    .frame(width: 300, height: 60)
                    .border(.red, width: 3)
                    .padding()
            }
            .frame(width: 350, height: 100)
            .border(.indigo, width: 3)
            
            VStack {
                Text("frame -> padding -> border")
                    .frame(width: 300, height: 60)
                    .padding()
                    .border(.red, width: 3)
            }
            .frame(width: 350, height: 100)
            .border(.indigo, width: 3)

            VStack {
                Text("border -> frame -> padding")
                    .border(.red, width: 3)
                    .frame(width: 300, height: 60)
                    .padding()
            }
            .frame(width: 350, height: 100)
            .border(.indigo, width: 3)

            VStack {
                Text("border -> padding -> frame")
                    .border(.red, width: 3)
                    .padding()
                    .frame(width: 300, height: 60)
            }
            .frame(width: 350, height: 100)
            .border(.indigo, width: 3)

            VStack {
                Text("padding -> frame -> border")
                    .padding()
                    .frame(width: 300, height: 60)
                    .border(.red, width: 3)
            }
            .frame(width: 350, height: 100)
            .border(.indigo, width: 3)

            VStack {
                Text("padding -> border -> frame")
                    .padding()
                    .border(.red, width: 3)
                    .frame(width: 300, height: 60)
            }
            .frame(width: 350, height: 100)
            .border(.indigo, width: 3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
