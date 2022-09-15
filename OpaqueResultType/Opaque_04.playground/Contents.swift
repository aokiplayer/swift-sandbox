import Foundation

/*
 ====================================================================
 Opaque 型は具体的な型情報を持っている（プログラマからは隠される）。
 コンパイラによる最適化で具体型に置き換えられれば、パフォーマンスの向上が見込める。
 ====================================================================
 */

protocol Shape {
    func draw()
}

struct Point: Shape {
    var x: Int
    var y: Int

    func draw() {
        print("A Point at (\(x), \(y)).")
    }
}

struct Line: Shape {
    var start: (x: Int, y: Int)
    var end: (x: Int, y: Int)
    
    func draw() {
        print("A Line from (\(start.x), \(start.y) to (\(end.x), \(end.y)).")
    }
}

// Opaque 型（some Shape 型）で返す
func makeShape1() -> some Shape {
    return Point(x: 10, y: 50)
}

// Opaque 型（some Shape 型）で返す
func makeShape2() -> some Shape {
    return Line(start: (10, 50), end: (200, 300))
}

// shape1, shape2 とも some Shape 型
var shape1 = makeShape1()
var shape2 = makeShape2()
shape1.draw()
shape2.draw()

// shape1, shape2 は同じ型とは限らないので、互換性はない
// Shape プロトコル型ではなく、あくまでも「Shape プロトコルに準拠した何らかの型」として、具体型情報を持っているため
// shape2 = shape1

// some Shape が具体型に置き換えられるということは、この実装はコンパイルエラー
// 同時に -> Point と -> Line の両方にはできないため
//func makeShape3(type: Int) -> some Shape {
//    if type > 0 {
//        return Line(start: (0, 0), end: (100, 100))
//    } else {
//        return Point(x: 0, y: 0)
//    }
//}
