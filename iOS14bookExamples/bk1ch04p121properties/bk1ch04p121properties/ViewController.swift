

import UIKit

class Moi {
    let first = "Matt"
    let last = "Neuburg"
    // let whole = self.first + " " + self.last // compile error
    // let whole = first + " " + last // different compiler error
}

class Moi2 {
    let first = "Matt"
    let last = "Neuburg"
    var whole : String {
        let temp = first + " " + last // can omit self here
        _ = temp
        return self.first + " " + self.last
    }
}

class Moi3 {
    let first = "Matt"
    let last = "Neuburg"
    lazy var whole = self.first + " " + self.last // can omit self here
    lazy var whole2 = first + " " + last
}

class Moi4 {
    let first = "Matt"
    let last = "Neuburg"
    // var whole : String = self.wholeName() // compile error
    func wholeName() -> String {
        return self.first + " " + self.last
    }
}

class Moi5 {
    let first = "Matt"
    let last = "Neuburg"
    var whole : String {return self.wholeName()}
    func wholeName() -> String {
        return self.first + " " + self.last
    }
}

class Moi6 {
    let first = "Matt"
    let last = "Neuburg"
    lazy var whole = self.wholeName()
    func wholeName() -> String {
        return self.first + " " + self.last
    }
}

class Moi7 {
    let first = "Matt"
    let last = "Neuburg"
    lazy var whole : String = { // "lazy" or we won't compile
        var s = self.first
        s.append(" ")
        s.append(self.last)
        return s
    }()
}

class Dog {
    let name : String
    let license : Int
    init(name:String, license:Int) {
        self.name = name
        self.license = license
    }
}

struct Greeting {
    static let friendly = "hello there"
    static let hostile = "go away"
    static let ambivalent = friendly + " but " + hostile // legal!
    static let ambivalent2a = Self.friendly + " but " + Self.hostile // compile error if you say `self`
    static let ambivalent2 = Greeting.friendly + " but " + Greeting.hostile
    static var ambivalent3 : String {
        self.friendly + " but " + self.hostile // legal!
    }
    static var ambivalent4 : String = {
        Self.friendly + " but " + Self.hostile // compile error if you say `self`
    }()

}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
        let fido = Dog(name:"Fido", license:1234)
        let spot = Dog(name:"Spot", license:1357)
        let aName = fido.name // "Fido"
        let anotherName = spot.name // "Spot"

    
        _ = aName
        _ = anotherName
    
    }

}

