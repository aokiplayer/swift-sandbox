import SwiftUI

struct ExampleEnvironment: View {
    // Environment の設定値を取得
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Environment(\.locale) private var locale: Locale
    
    @State private var isModalPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Text("Current ColorScheme")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("\(colorScheme == .light ? "light" : "dark")")
                        .font(.body)
                }
                .padding()
                
                HStack {
                    Text("Current Locale")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("\(locale.identifier)")
                        .font(.body)
                }
                .padding()
                
                HStack {
                    Spacer()

                    Button {
                        isModalPresented.toggle()
                    } label: {
                        Text("次画面へ")
                            .font(.headline)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .frame(width: 200, height: 48)
                    .sheet(isPresented: $isModalPresented) {
                        MyModalView()
                    }
                    
                    Spacer()
                }

            }
            .navigationTitle("Environment の利用")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct MyModalView: View {
    // Environment の設定値を取得
    // モーダルで遷移した場合、一部の Environment は引き継がれない
    // （見た目に関わるものは引き継がれない？）
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Environment(\.locale) private var locale: Locale

    // Environment には、アクションなども含まれている
    @Environment(\.dismiss) private var dismiss: DismissAction

    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Text("Current ColorScheme")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("\(colorScheme == .light ? "light" : "dark")")
                        .font(.body)
                }
                .padding()
                
                HStack {
                    Text("Current Locale")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("\(locale.identifier)")
                        .font(.body)
                }
                .padding()
                
                Text("Environment のうち、locale は伝播しているが colorScheme は伝播していない。")
                    .padding()

                HStack {
                    Spacer()
                    
                    Button {
                        // Environment を取得したビュー（ここでは MyModalView）を閉じる
                        dismiss()
                    } label: {
                        Text("Close")
                            .font(.headline)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .frame(width: 200, height: 48)
                    
                    Spacer()
                }
            }
            .navigationTitle("Environment の伝播")
        }
    }
}

struct Example_Environment_Previews: PreviewProvider {
    static var previews: some View {
        ExampleEnvironment()
            // Environment に値を設定
            .environment(\.locale, Locale(identifier: "ja_JP"))
            .environment(\.colorScheme, .dark)
    }
}
