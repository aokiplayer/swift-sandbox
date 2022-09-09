import SwiftUI

struct ExampleTextField: View {
    @State private var inputEmail: String = ""
    @State private var inputPassword: String = ""
    @State private var user: PersonNameComponents = PersonNameComponents()
    
    @Environment(\.locale) private var currentLocale: Locale
    
    var body: some View {
        VStack {
            Text("テキストフィールド")
                .font(.title)
            
            Form {
                Section("メール情報") {
                    // 通常のテキストフィールドとパスワード用
                    TextField("メールアドレス", text: $inputEmail)
                        .autocorrectionDisabled(true)
                        .keyboardType(.emailAddress)
                    
                    SecureField("パスワード", text: $inputPassword)
                        .autocorrectionDisabled(true)
                        .keyboardType(.default)
                }
                
                Section("入力結果") {
                    Text(inputEmail)
                    Text(inputPassword)
                }
                
                Section("ユーザー情報") {
                    // スタイルに .name を指定すると、スペース区切りで姓名を分割して保持する
                    // 入力する名前によって "GivenName FamilyName" なのか "FamilyName GivenName" なのか判断してくれてる
                    // けど、判定が怪しい
                    // ex) 山田 二郎 -> Family Given (OK: 漢字なら姓名の順なのかな)
                    //     二郎 山田 -> Family Given (NG: これは納得。漢字だし）
                    //     Jiro Yamada -> Given Family (OK: アルファベットだし、この順だよね)
                    //     Yamada Jiro -> Family Given (OK: 全部アルファベットなのに正しく認識。えらい！)
                    //     Jun Miho -> Family Given (NG: なぜ？)
                    //     Miho Jun -> Given Family (NG: なぜ？)
                    TextField(value: $user, format: .name(style: .medium).locale(currentLocale)) {
                        Label {
                            Text("氏名（スペース区切り）")
                        } icon: {
                            Image(systemName: "person")
                        }
                    }
                    .autocorrectionDisabled(true)
                    .keyboardType(.default)
                }
                
                Section("入力結果") {
                    Text(user.debugDescription)
                }
            }
        }
    }
}

struct Example_TextField_Previews: PreviewProvider {
    static var previews: some View {
        ExampleTextField()
            .environment(\.locale, Locale(identifier: "ja_JP"))
    }
}
