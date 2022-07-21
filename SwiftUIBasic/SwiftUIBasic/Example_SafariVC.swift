import SwiftUI
import SafariServices

// MARK: UIViewController を SwiftUI で利用するためには UIViewControllerRepresentable に準拠した型を作成する
struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController

    var url: URL

    // MARK: インスタンス生成時に呼ばれる
    // Context は UIViewControllerRepresentableContext<Self> のエイリアス
    func makeUIViewController(context: Context) -> SFSafariViewController {
        print(#function)
        return SFSafariViewController(url: url)
    }

    // MARK: データ更新時に呼ばれる
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        print(#function)
    }
}

struct ExampleSafariVC: View {
    var body: some View {
        SafariView(url: URL(string: "https://www.apple.com/jp")!)
    }
}

struct ExampleSafariVC_Previews: PreviewProvider {
    static var previews: some View {
        ExampleSafariVC()
    }
}
