import Foundation

//: ## associatedtype を持ったプロトコル型の宣言に関する課題
print("""

associatedtype を持ったプロトコル型の宣言に関する課題
===============================================
""")

// お店で扱う商品の種類
struct Drug {
    var item: String
}

/**
 何らかのお店を表すプロトコル.
 商品の種類は associatedtype により柔軟に指定できるようにしている.
 */
protocol Store {
    associatedtype T
    
    var kind: T { get }
    func kindsOfStore() -> T
}

/**
 具体的なお店（マツモトキヨシ）.
 associatedtype は Drug として確定.
 */
class MatsumotoKiyoshi: Store {
    var kind: Drug
    
    init(kind: Drug) {
        self.kind = kind
    }
    
    func kindsOfStore() -> Drug {
        return kind
    }
}

/**
 具体的なお店（赤ひげ）
 associatedtype は Drug として確定.
 */
class AkaHige: Store {
    var kind: Drug
    
    init(kind: Drug) {
        self.kind = kind
    }
    
    func kindsOfStore() -> Drug {
        return kind
    }
}

/**
 MatsumotoKiyoshi は Store プロトコルに準拠しているので問題なさそうだが、
 associatedtype を持つのでこの宣言はできない.
 */
//var myStore1: Store = MatsumotoKiyoshi(kind: Drug(item: "絆創膏"))

/**
 実際には Swift 5.1 で導入された Opaque Types により、some キーワードを利用して
 以下のように記述できる.
 https://docs.swift.org/swift-book/LanguageGuide/OpaqueTypes.html
 https://www.swiftlangjp.com/language-guide/opaque-types.html
 */
var myStore1: some Store = MatsumotoKiyoshi(kind: Drug(item: "絆創膏"))
print(myStore1.kindsOfStore())

//:---
//: ## 型消去による解決
print("""

型消去による解決
===============================================
""")

/**
 AnyStore は、Store に準拠したクラスの associatedtype をジェネリクスとして持つ.
 */
class AnyStore<T>: Store {
    // kind の型は、イニシャライザで決まる.
    var kind: T
    
    /**
     引数として、Store に準拠したオブジェクトを受け取る.
     where 句で、AnyStore の associatedtype T を引数で受け取ったオブジェクトの
     T と同じ型としている.
     */
    init<S: Store>(store: S) where T == S.T {
        self.kind = store.kind
    }

    func kindsOfStore() -> T {
        return kind
    }
}

/**
 具体型である MatsumotoKiyoshi ではなく、抽象型である AnyStore 型として宣言できている.
 このように、型消去により具体型情報を消去できていることがわかる.
 */
var myStore2: AnyStore<Drug>

myStore2 = AnyStore(store: MatsumotoKiyoshi(kind: Drug(item: "絆創膏")))
print(myStore2.kindsOfStore())

/**
 Store に準拠し、associatedtype として Drug を持つオブジェクトを格納できる配列.
 型消去により、`MatsumotoKiyoshi` だけでなく `AkaHige` も格納可能.
 */
var stores: [AnyStore<Drug>]

stores = [
    AnyStore(store: MatsumotoKiyoshi(kind: Drug(item: "歯ブラシ"))),
    AnyStore(store: AkaHige(kind: Drug(item: "毒マムシドリンク"))),
]

for store in stores {
    print(store.kindsOfStore())
}

print("""

`some` from Swift 5.1 vs `any` from Swift 5.6.
===============================================
""")
/**
 `some` from Swift 5.1 vs `any` from Swift 5.6.
 */
//var someStores: [some Store]    // NG
var anyStores: [any Store]      // OK

anyStores = [
    MatsumotoKiyoshi(kind: Drug(item: "絆創膏")),
    MatsumotoKiyoshi(kind: Drug(item: "歯ブラシ")),
    AkaHige(kind: Drug(item: "毒マムシドリンク")),
]

for store in anyStores {
    print(store.kindsOfStore())
}
