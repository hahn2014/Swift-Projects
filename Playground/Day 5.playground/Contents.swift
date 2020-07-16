import Cocoa

//function handling
func printHelp() {
    let message = """
    Welcome to MyApp!

    Run this app inside a directory of images and
    MyApp will resize them all into thumbnails
    """

    print(message)
}

printHelp()

//function arguments
func square(number: Int) {
    print(number * number)
}

square(number: 20)

//function return values
func squareReturn(number: Int) -> Int {
    return number * number
}

print(squareReturn(number: 8))

//argument double meanings
func squareArgs(to num: Int) -> Int {
    return num * num
}

squareArgs(to: 4)


//ommiting paramater names
func printGreeting(_ str: String) {
    print("Hello, \(str)")
}

printGreeting("Bryce")

//default formatting
func greet(_ person: String, nicely: Bool = true) {
    if (nicely == true) {
        print("Hello, \(person)!")
    } else {
        print("oh boy.. It's \(person) again..")
    }
}

greet("Taylor")
greet("Taylor", nicely: false)

//variadic functions (unlimited args)
func squareVar(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

squareVar(numbers: 1, 2, 3, 4, 5, 6, 7, 8)

//function exception throwing
enum PasswordError: Error { //declare a throwable type
    case invalid
    case tooEasy
}

func checkPassword(_ password: String) throws -> Bool {
    if (password == "password") {
        throw PasswordError.tooEasy
    }
    return true
}

//running functions with a throwable error (avoid app force closing)
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("Password is invalid!")
}

//inout arguments
func doubleVar(num: inout Int) {
    num *= 2
}

var bigNum = 2000

doubleVar(num: &bigNum)
