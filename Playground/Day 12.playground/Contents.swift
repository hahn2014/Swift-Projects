import Cocoa

//optionals - Can have a valid value, nil, or no value at all
var age: Int? = nil
print(age)

age = 48
print(age)

//unwrapping optionals safely
var name: String? = nil
name = "Bryce"
if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

//unwrapped optionals using guard let
func greet(_ name: String?) {
    guard let unwrapped = name else { //we keep unwrapped if a value was found
        print("You didn't provide a name!")
        return //else exit greet completly
    }
    print("Hello, \(unwrapped)!")
}

greet(name)

//force unwrapped optionals
let str = "52"
let badStr = "not an integer"

let optionalNum = Int(badStr)       //cast string to int (this will by default make the int optional
let goodNum = Int(str)!             //force the int cast, as we know str is a valid int

print("OptionalNum: \(optionalNum), GoodNum: \(goodNum)")


//implicitely unwrapped optionals at declaration
var personAge: Int! = nil //this will allow for nil at start, but is expected to have a value before usage


// nil coalescing optionals
func username(for id: Int) -> String? {
    if (id == 1) {
        return "Talor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous" //declare the default value, which is assigned if username() returns nil

//optional chaining
let names = ["John", "Kyle", "Chad", "Bruce", "Mark"]
let EmptyNames = [String]()

let beatles = names.first?.uppercased()
let shouldBeNothing = EmptyNames.first?.lowercased() //ignore anything after the failed test (first?)



//optionals using try
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

//try? returns nil if failed (error) or the value from checkPassword if suceeded
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}


//if you know the function won't fail, implicitly unwrap the value
try! checkPassword("sekrit")
print("OK!")


//optional initialization function
struct Person {
    var id: String
    
    init?(id: String) {
        if (id.count == 9) { //if the id is anything other than 9 char long string, return nil
            self.id = id
        } else {
            return nil
        }
    }
}

//type casting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Dog(), Fish(), Dog(), Fish()]

for pet in pets {
    if let dog = pet as? Dog { //if the current pet is of type 'Dog' continue, else return nil
        dog.makeNoise()
    }
}
