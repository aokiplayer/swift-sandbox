import SwiftUI

struct ExampleAttributedString: View {
    var body: some View {
        Text(attributedSumoString())
            .multilineTextAlignment(.leading)
    }
}

fileprivate func attributedSumoString() -> AttributedString {
    let message = """
        「君は、相撲部か？」
        
        その男は、コンビニのレジから突然話しかけてきた。
        いったい何を言っているのだ、この男は。私は即座に警戒した。だが、男はさも当然のように叫んだ。

        「ウィー！」

        それを聞いて、私はすぐにでも逃げ出したかった。しかし、手に持ったおでんの容器を放り出す訳にはいかない。かと言って、持ったまま店外に出れば私は犯罪者だ。

        相撲部であるかどうか、回答するしか道は残されていないのか。
        
        しかし、私のバッグからは使い込まれた金属バットが飛び出している。そこにはグローブもぶら下がっている。何をどう考えたら、私が相撲部に見えるのだ。
        この男は、精神に異常を来しているのか。だとしたら、彼の期待するように相撲部と答えるべきなのか。

        だが、嘘がつけない私は、意を決して答えた。

        『いいえ、帰宅部です。』
        """
    
    // 装飾対象の文字列を作成（AttributedString 型）
    var attributedString = AttributedString(message)

    // 部分文字列（AttributedSubstring 型）を作成（この時点では文字列全体）
    var substring =  attributedString[attributedString.startIndex...]
    
    // 部分文字列内で、対象範囲を取得（取得できなくなるまで繰り返し）
    while let range = substring.range(of: "相撲部") {
        // 装飾は AttributedSubstring ではなく AttributedString に対して行う
        attributedString[range].foregroundColor = .red
        attributedString[range].font = .headline

        // 検索対象範囲を変更（マッチした部分の後ろから検索）
        substring = substring[range.upperBound...]
    }

    return attributedString
}

struct Example_AttributedString_Previews: PreviewProvider {
    static var previews: some View {
        ExampleAttributedString()
    }
}
