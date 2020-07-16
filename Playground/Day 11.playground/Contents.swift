import Cocoa

//protocols are guidelines for struct formatting
protocol Identifiable {
    var id: String { get set } //require an 'id' String (get = readable, set = writable)
}

struct User: Identifiable { //create a User based off the Identifiable protocol requirements
    var id: String
}

func displayID(thing: Identifiable) { //now we can guarentee confomity by calling parent value
    print("The ID is \(thing.id)")
}

var newUser = User(id: "123")
displayID(thing: newUser)

//protocol inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}
    //now finally, create a protocol inheriting all 3

protocol Employee: Payable, NeedsTraining, HasVacation {
    //define stuff
}

//type extensions allow you to define functions for pre-existing types
extension Int {
    func squared() -> Int {
        return self * self
    }
    
    var isEven: Bool {
        return self % 2 == 0
    }
}

var newnum = 3
print(newnum)
print(newnum.squared())
print(newnum.isEven ? "\(newnum) is even" : "\(newnum) is odd")


//protocol extensions are similar to type extensions but work with function protocols
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection { //collections are a protocol for arrays or sets
    func summarize() {
        print("There are \(count) in the list")
        
        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()



//protocol oriented programming
protocol Identifiable1 {
    var id: String { get set } //an ID, and function to disp the id is require for all 'identifiable1' objects
    func identify()
}

extension Identifiable1 {
    func identify() {
        print("The ID is \(id).")
    }
}

struct User2: Identifiable1 { //now when we create an identifiable1 object, it comes pre-loaded with identify func
    var id: String
}

var user1 = User2(id: "hahnsolo")
user1.identify()
