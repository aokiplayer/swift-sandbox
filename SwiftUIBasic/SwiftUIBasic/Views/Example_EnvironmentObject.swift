import SwiftUI

struct ExampleEnvironmentObject: View {
    // 階層間の受け渡しをすることなく、値を取得できる
    // React の Context API のイメージ
    @EnvironmentObject var colors: MyAppColors
    
    var body: some View {
        ZStack {
            colors.myBackgroundColor
                .ignoresSafeArea()
            
            Text("EnvironmentObject の利用")
                .font(.title)
                .foregroundColor(colors.myFontColor)
        }
    }
}

struct Example_EnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        ExampleEnvironmentObject()
            // ここではビューに対して指定してるけど、上の階層でセットしたものも取得できる
            .environmentObject(
                MyAppColors(myBackgroundColor: .yellow,
                            myFontColor: .indigo))
    }
}
