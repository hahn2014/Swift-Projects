import Cocoa

//arrays
let val1 = "Option 1"
let val2 = "Option 2"
let val3 = "Option 3"
let val4 = "Option 4"

let values = [val1, val2, val3, val4]
values[1]

//sets - similar to an array, non-duplicates and unordered
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "green", "yellow", "red"])

//Tuples
var name = (first: "Bryce", last: "Hahn")
name.0
name.last

name.first = "Jonny"
name.1 = "Appleseed"
name

//Dictionaries
let height = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]

height["Taylor Swift"]
height["Skrillex"]


//Creating empty collections (Arrays, Sets, or Dictionaries)
var teams = [String: String]() //empty Dictionary of Strings
teams["Development"] = "Bryce"
teams["Sound"] = "Timmy"
teams

var results = [Int]() //empty array of Ints

var words = Set<String>() //empty Set of Strings

//Enumerators
let result1 = "Failure"
let result2 = "Failed" //these are bad

enum Result {
    case failure
    case success
}

let result3 = Result.failure

//associated enum values
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(Volume: Int)
}

let activity = Activity.running(destination: "Home")

//raw values for enums
enum Planets: Int {
    case mercury = 1 // force first to start at 1, not 0
    case venus
    case earth
    case mars
}

let earth = Planets(rawValue: 3)
