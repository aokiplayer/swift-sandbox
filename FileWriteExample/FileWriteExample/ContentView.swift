import SwiftUI

struct ContentView: View {
    // ファイルの URL
    private var url: URL {
        // ユーザー（つまりアプリ）の Documents ディレクトリにファイル名を追加した URL.
        // 対象のファイルがなければ作成
        return try! FileManager.default.url(for: .documentDirectory,
                                            in: .userDomainMask,
                                            appropriateFor: nil,
                                            create: true).appending(path: "note.txt")
    }
    
    @State private var inputText: String = ""
    @State private var fileContent: String = "ファイル内容を表示"
    
    var body: some View {
        VStack {
            Text("ファイルの読み書き")
                .font(.title)
            ZStack(alignment: .leading) {
                // Text には複数行表示するので行数制限なしにしておき、スクロールビューに埋め込む
                ScrollView {
                    Text(fileContent)
                        .lineLimit(nil)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
                .frame(height: 200)
                .padding(5)
                .overlay(RoundedRectangle(cornerRadius: 3).stroke(.gray, lineWidth: 3))
            }
            
            TextEditor(text: $inputText)
                .frame(height: 200)
                .overlay(RoundedRectangle(cornerRadius: 3).stroke(.gray, lineWidth: 3))
            
            HStack {
                Button {
                    // FIXME: トップまでスクロールできない問題
                    // 読み込みボタンをタップした際に、結果の Text のスクロール位置が保持されてしまうので、
                    // 保存する際にいったん Text をクリアすることでお茶を濁している
                    // 本当は、読み込みを行った際に一番上までスクロールしたい
                    fileContent = "ファイル内容を表示"

                    let data = inputText.data(using: .utf8)!
                    
                    do {
                        // URL を指定して書き込み
                        try data.write(to: url)
                        inputText = ""
                        print(url.absoluteString)
                    } catch {
                        fileContent = "\(error)"
                    }
                } label: {
                    Label("ファイルを保存", systemImage: "doc.plaintext")
                        .frame(width: 160, height: 48)
                }
                
                Button {
                    do {
                        // URL を指定して読み込み
                        let data = try Data(contentsOf: url)
                        fileContent = String(data: data, encoding: .utf8)!
                    } catch {
                        print("\(error)")
                    }
                } label: {
                    Label("読み込み", systemImage: "doc.plaintext")
                        .frame(width: 160, height: 48)
                        .lineLimit(0)
                }
            }
            
            Button {
                inputText = ""
                fileContent = "ファイル内容を表示"
            } label: {
                Label("クリア", systemImage: "eraser")
                    .frame(width: 160, height: 48)
            }
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
