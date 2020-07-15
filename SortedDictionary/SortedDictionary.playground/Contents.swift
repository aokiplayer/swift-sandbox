import Foundation

var scores: [String: Int] = [
    "Steve Yamada": 34,
    "Jeff Takeshita": 87,
    "Mickey Yoshida": 100,
    "Charly Kinoshita": 53,
    "Anna Saito": 19,
    "Robert Suzuki": 97,
    "Erick Kawakami": 32,
    "John Miyabe": 64,
    "Gregory Goto": 76
]

print("""

    Ascending by key
    ========================
    """)
var sortedByNameAsc: [(key: String, value: Int)] = scores.sorted { $0.key < $1.key }
sortedByNameAsc.forEach { print("\($0.key): \($0.value)") }

print("""

    Descending by key
    ========================
    """)
var sortedByNameDesc: [(key: String, value: Int)] = scores.sorted { $0.key > $1.key }
sortedByNameDesc.forEach { print("\($0.key): \($0.value)") }

print("""

    Ascending by value
    ========================
    """)
var sortedByScoreAsc: [(key: String, value: Int)] = scores.sorted { $0.value < $1.value }
sortedByScoreAsc.forEach { print("\($0.value): \($0.key)") }

print("""

    Descending by value
    ========================
    """)
var sortedByScoreDesc: [(key: String, value: Int)] = scores.sorted { $0.value > $1.value }
sortedByScoreDesc.forEach { print("\($0.value): \($0.key)") }
