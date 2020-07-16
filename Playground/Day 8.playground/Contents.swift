import Cocoa

//structs: The basics
struct Sport {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if (isOlympicSport) {
            return "\(name) is an Olympic Sport"
        } else {
            return "\(name) is not an Olympic Sport"
        }
    }
}

let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

//calling actions on value changes

struct Progress {
    var task: String
    var amount: Int {
        didSet { //print a message every time amount is changed
            print("\(task) is now \(amount)% complete")
        }
    }
}

//functions inside structs
struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()

//altering values of struct
struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Joe")
print(person.name)
person.makeAnonymous()
print(person.name)

//Since a String is a struct type, we can call multiple methods
var str = "To be or not to be, that is the QUESTION"
print(str.count)
print(str.hasPrefix("To")) //return true if str starts with "To"
print(str.uppercased())
print(str.lowercased())
print(str.sorted())

//Arrays are struct types as well
var toys = ["Woody", "Buzz", "Mr. Potatohead"]
print(toys.count)
print(toys.sorted())
toys.append("Rex") //add a new element to the end of the array
toys.firstIndex(of: "Buzz")
toys.remove(at: 0) //remove value at index
