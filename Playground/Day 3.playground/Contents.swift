import Cocoa

//ternary operator
let firstCard = 11
let secondCard = 10
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

//switch statements
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}

//ranges

let score = 85

switch score {
case 0..<50:    //0 through 49 (up to)
    print("You failed badly.")
case 50...84:   //50 though 84 (through)
    print("You did OK.")
default:
    print("You did great!")
}
