import Foundation

protocol FlyingObject { }

class AirPlane: FlyingObject { }
class Bird: FlyingObject { }

func makeFlyingObject1() -> some FlyingObject {
    AirPlane()
}

func makeFlyingObject2() -> some FlyingObject {
    Bird()
}

var object1 = makeFlyingObject1()   // "some FlyingObject" type

var object2 = makeFlyingObject2()   // A different "some FlyingObject" type from object1
var object3 = makeFlyingObject1()   // A same "some FlyingObject" type from object1

// NG (Different "some FlyingObject" types)
//object1 = object2

// OK (The same "some FlyingObject" type)
object1 = object3
