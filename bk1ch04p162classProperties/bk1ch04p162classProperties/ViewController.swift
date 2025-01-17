

import UIKit

class C {
    let x = "howdy"
}

// can't override a constant stored property at all
class CC : C {
//    override var x : String {
//        get { "yoho" }
//    }
    // override let x = "asdf"
}


class Dog {
    static func whatDogsSay() -> String {
        return "woof"
    }
    func bark() {
        print(Dog.whatDogsSay())
    }
}

// compile error:
/*

class NoisyDog : Dog {
    override class func whatDogsSay() -> String {
        return "WOOF"
    }
}

*/


class Dog2 {
    class func whatDogsSay() -> String {
        return "woof"
    }
    func bark() {
        print(Dog.whatDogsSay())
    }
}

class NoisyDog2 : Dog2 {
    override class func whatDogsSay() -> String {
        return "WOOF"
    }
}

class Dog3 {
    static var whatDogsSay = "woof"
    func bark() {
        print(Dog.whatDogsSay)
    }
}

// compile error (and so for other variants):
/*
class NoisyDog3 : Dog3 {
    override static var whatDogsSay : String {
        set {
            
        }
        get {
            return "WOOF"
        }
    }
}
*/

class Dog4 {
    class var whatDogsSay : String {
        return "woof"
    }
    func bark() {
        print(Dog.whatDogsSay)
    }
}

class NoisyDog4 : Dog4 {
    override static var whatDogsSay : String {
        return "WOOF"
    }
}




class ViewController: UIViewController {


}

