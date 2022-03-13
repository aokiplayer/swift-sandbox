//: # プロパティが nil の場合もエンコード先の JSON に属性を出力する
import Foundation

//: ## 通常の挙動（nil を含んだ列は JSON には含まれない）

// JSON と対応させる Person 型（Codable に準拠）
struct Person: Codable {
    let name: String
    let age: Int?   // nil を許容
}
//: - - -
let encoder = JSONEncoder()

let yamada = Person(name: "山田二郎", age: 53)
let kawada = Person(name: "川田吾郎", age: nil)

let yamadaData = try! encoder.encode(yamada)
let kawadaData = try! encoder.encode(kawada)

print("==== 値が nil の属性は出力されない ====")
print(String(data: yamadaData, encoding: .utf8)!)
print(String(data: kawadaData, encoding: .utf8)!)

//: - - -
//: ## nil を含む属性を出力するように変更したもの

// JSON と対応させる CustomPerson 型（Codable に準拠）
struct CustomPerson: Codable {
    let name: String
    let age: Int?   // nil を許容
}

// Encodable プロトコルの encode(to:) メソッドをオーバーライド
// Codable は Encodable & Decodable 型
extension CustomPerson {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)

        // 通常は nil なら無視されるが、明示的にこのフィールドを encode 処理する
        try container.encode(self.age, forKey: .age)
    }
}
//: - - -
let sunagawa = CustomPerson(name: "砂川黄太郎", age: 87)
let umino = CustomPerson(name: "海野泳太郎", age: nil)

let sunagawaData = try! encoder.encode(sunagawa)
let uminoData = try! encoder.encode(umino)

print("==== 値が nil の属性も出力される ====")
print(String(data: sunagawaData, encoding: .utf8)!)
print(String(data: uminoData, encoding: .utf8)!)
