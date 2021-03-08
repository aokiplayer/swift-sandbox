//: # Codable の基本的な実装
//: [カスタムデコード/カスタムエンコードのサンプルへ](@next)
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
// JSONと対応させるPerson型（Codableに準拠）
struct Person: Codable {
    let name: String
    let scores: [Score]

    /// SwiftのプロパティとJSONのキーをマッピング
    enum CodingKeys: String, CodingKey {
        // case Swift側の名前 = "JSON側のキー"
        case name = "user_name"
        case scores
    }
}

// Personのプロパティとして利用する型（Codableに準拠）
struct Score: Codable {
    let score: Int
}
//: ---
let decoder = JSONDecoder()
let yamada = try decoder.decode(Person.self, from: data1)

print(yamada.name)
yamada.scores.forEach { s in
    print(s.score)
}

print("------------------------------")
//: ---
let kawada = Person(name: "川田吾郎", scores: [Score(score: 60), Score(score: 80)])

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
let data2 = try encoder.encode(kawada)

print(String(data: data2, encoding: .utf8)!)
