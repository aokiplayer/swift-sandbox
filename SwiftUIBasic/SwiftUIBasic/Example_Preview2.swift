import SwiftUI

struct ExamplePreview2: View {
    var body: some View {
        Label("複数デイバスでプレビュー", systemImage: "iphone")
            .font(.title)
            .imageScale(.large)
            .symbolRenderingMode(.multicolor)
    }
}

struct Example_Preview2_Previews: PreviewProvider {
    static var previews: some View {
        let devices = ["iPhone SE (3rd generation)",
                       "iPhone 13 Pro",
                       "iPad Pro (11-inch) (3rd generation)"]
        
        ForEach(devices, id: \.self) { deviceName in
            ExamplePreview2()
                .previewDevice(.init(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
