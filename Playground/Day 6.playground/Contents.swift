import Cocoa

//closures : The basics
let driving = {
    print("I'm driving a car")
}

driving()

//closures with arguments
let driving2 = {
    (place: String) in
    print("I'm driving to \(place) in my car")
}

driving2("Portland")

//closures with return statements
let drivingRet = {
    (place: String) -> String in
    return "I'm driving to \(place) in my car"
}

print(drivingRet("Portland"))

//closures as a paramater
func travel(action: () -> Void) { //declare a closure param: () -> Void
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving)

//trailing closure (no argument passed
travel { //call the travel function, and since the last argument is a closure,
    print("I'm driving a car!") //we can simply define the closure in a bracket body
}


