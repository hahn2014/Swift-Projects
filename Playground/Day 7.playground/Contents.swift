import Cocoa

//nested closures with parameters
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel {
    (place: String) in
    print("I'm going to \(place) in my car")
}

//nested closures with return statements
func travel2(action: (String) -> String) {
    print("I'm getting ready to go.")
    print(action("Portland"))
    print("I arrived!")
}

//travel2 {
//    (place: String) -> String in
//    return "I'm going to \(place) in my car"
//}

//simplifying the travel2 call
travel2 { //swift knows the argument, and return types are String (From function2 declaration)
    //swift also can auto-name arguments, meaning as long as we know the order we can simply use $0, $1, $2, ...
    "I'm going to \($0) in my car" //and since our closure is only one line, swift assumes it a return
} //so we don't need to define a return statement explicitely


//closures with multiple arguments
func travel3(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    print(action("Bend", 60))
    print("I've arrived!")
}

travel3 {
    "I'm going to \($0) in my car, traveling at \($1) mph."
}

//returning a closure statement
func travel4() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel4()
result("Seattle")

//or more simply:
travel4()("Boston")


//holding values with closures
func travel5() -> (String) -> Void {
    var count = 1
    return {
        print("\(count), I'm going to \($0)")
        count += 1
    }
}

let result2 = travel5()
result2("London")
result2("Hong Kong")
result2("Paris")
