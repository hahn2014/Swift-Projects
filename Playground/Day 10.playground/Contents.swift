import Cocoa

//working with classes
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) { //for a class the init() func is required
        self.name = name
        self.breed = breed
    }
    
    func dogDetails() -> String {
        return "\(name) is a \(breed)."
    }
    
    func makeNoise() {
        print("BOOF!")
    }
}
let poppy = Dog(name: "Poppy", breed: "Poodle")
poppy.dogDetails()

//inheritance
class Poodle: Dog { //a poodle class inherits the 'dog' parent class
    init(name: String) {
        super.init(name: name, breed: "Poodle") //call the parent init with new values
        //super.init() is a required call in a child class
    }
    
    override func makeNoise() {
        print("Woof!") //less intimidating than boof
    }
}

let poodle = Poodle(name: "Sebatian")
poodle.makeNoise()

//final class allows for un-editable class structure
final class Test { //non inheritable
    var t1: String
    
    init(t1: String) {
        self.t1 = t1
    }
    
    func f1(t1: String) -> String {
        return "\(t1) is a String value"
    }
}

//this fails
//class Test2: Test {
//    override func f1() {
//        //this is impossible
//    }
//}

//class copying
class Singer {
    var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "James Earl Jones"
print(singer.name)
print(singerCopy.name)

//class deinitializers
class Person {
    var name = "John Doe"

    init(index: Int) {
        self.name = "\(name) (\(index))"
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit { //ran only when a var of 'Person' is destroyed
        print("\(name) is no more!")
    }
}

for x in 1...3 {
    let person = Person(index: x)
    person.printGreeting()
}

//mutability
let taylor = Singer() //define taylor as a constant class value instead of varaible
 //if this was a struct we wouldn't be able to edit values inside
taylor.name = "Bryce Hahn"
print(taylor.name)

//if we want to avoid this, define varaibles in the class as 'let' instead of 'var'
