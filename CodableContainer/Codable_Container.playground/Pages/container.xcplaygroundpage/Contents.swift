//: # カスタムデコード/カスタムデコード
//: [Codable の基本的な実装のサンプルへ](@previous)
import Foundation

let data1: Data = """
    {
        "user_name": "山田二郎",
        "scores": [
            { "score": 65 },
            { "score": 24 }
        ]
    }
    """.data(using: .utf8)!
//: ---
// JSONに対応する構造体
struct Person: Codable {
    let name: String
    let scores: [Int]

    // トップレベルの属性に対応するCodingKeys
    enum CodingKeys: String, CodingKey {
        case name = "user_name"
        case scores
    }
    
    // ネストしたJSONの属性に対応するCodingKeys
    enum ScoresCodingKeys: String, CodingKey {
        case score
    }
}
//: ---
// カスタムデコード用のイニシャライザを追加
extension Person {
    init(from decoder: Decoder) throws {
        // CodingKeysを指定し、JSON直下の属性（"user_name"と"scores"にあたる部分）に対するコンテナを取得
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        // JSONのキー"user_name"にあたる部分の値を取得
        let name = try rootContainer.decode(String.self, forKey: .name)
        
        // ネストしたオブジェクト（キー"scores"）の配列部分（配列なので中身の各要素にはキーがない）のコンテナを取得
        var arrayContainer = try rootContainer.nestedUnkeyedContainer(forKey: .scores)

        var scores: [Int] = []

        // 配列の要素の最後になるまで繰り返し
        while !arrayContainer.isAtEnd {
            // ネストした部分のCodingKeys（ここではScoresCodingKeys）を指定し配列内のオブジェクト部分のコンテナを取得
            let scoreContainer = try arrayContainer.nestedContainer(keyedBy: ScoresCodingKeys.self)
            
            // JSONのキー"score"にあたる部分の値を取得
            let score = try scoreContainer.decode(Int.self, forKey: .score)

            // 取得した値を配列に追加
            scores.append(score)
        }

        // 取得した値をメンバワイズイニシャライザに渡して初期化
        self.init(name: name, scores: scores)
    }
}
//: ---
// カスタムエンコード用のメソッドを追加
extension Person {
    // カスタムでエンコードするためのメソッド
    func encode(to encoder: Encoder) throws {
        // CodingKeysを指定し、JSON直下の属性（"user_name"と"scores"にあたる部分）に対するコンテナを取得
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        // JSONのキー"name"にあたる部分をエンコード
        try container.encode(self.name, forKey: .name)

        // ネストしたオブジェクト（キー"scores"）の配列部分（配列なので中身の各要素にはキーがない）のコンテナを取得
        var scoresContainer = container.nestedUnkeyedContainer(forKey: .scores)

        // scores配列をループし、各要素をエンコード
        for score in scores {
            // ネストした部分のCodingKeys（ここではScoresCodingKeys）を指定し配列内のオブジェクト部分のコンテナを取得
            var arrayContainer = scoresContainer.nestedContainer(keyedBy: ScoresCodingKeys.self)

            // JSONのキー"score"にあたる部分をエンコード
            try arrayContainer.encode(score, forKey: .score)
        }
    }
}
//: ---
let decoder = JSONDecoder()
let yamada = try decoder.decode(Person.self, from: data1)

print(yamada.name)
yamada.scores.forEach { score in
    print(score)
}
print("------------------------------")
//: ---
let kawada = Person(name: "川田吾郎", scores: [60, 80])

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
let data2 = try encoder.encode(kawada)

print(String(data: data2, encoding: .utf8)!)
