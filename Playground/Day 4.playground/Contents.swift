import Cocoa

//for loops]
let count = 1...10
for number in count {
    print("Number is \(number)")
}

print("Players gonna ")

for _ in 1...5 { //use an underscore if the value doesn't need to be called on
    print("play")
}

//repeating loop (Do-While loop)
var number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

//breaking from nested loops

outerLoop: for i in 1...10 { //outerLoop is a label
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop //break from outerLoop label
        }
    }
}
