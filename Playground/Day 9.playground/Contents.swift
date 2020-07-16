import Cocoa

//define default struct values
struct User {
    var username: String
    
    init () {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

//var user = User(username: "Test")
var user = User() //with a default value, we no longer need to provide on instantiation
user.username = "Test"

//Swift 'this' equivalent
struct Person {
    var name: String
    
    init (name: String) { //init can be provided with arguments
        self.name = name //swift equivalent of this.(var)
        print("\(name) was born!")
    }
}

var p = Person(name: "Bryce")

//lazy variables only get created when the variable is accessed from elsewhere in the code
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person1 {
    var name: String
    lazy var familyTree = FamilyTree() //only create a family tree when we declare it
    
    init (name: String) { //init can be provided with arguments
        self.name = name //swift equivalent of this.(var)
        print("\(name) was born!")
    }
}

var p1 = Person1(name: "Quentin")
p1.familyTree

//static variables allow a shared access of the value accross any instance of said struct
struct Student {
    static var classSize = 0 //any instance of student can access and modify a unified "classSize" var
    var name: String
    
    init (name: String) {
        self.name = name
        Student.classSize += 1 //every creation of student var, add to class size
    }
}

var s1 = Student(name: "Bryce")
var s2 = Student(name: "John")
var s3 = Student(name: "Taylor")

print("Class has \(Student.classSize) students.")

//private variables
struct Person2 {
    var name: String
    var id: String
    
    init(name: String, id: String) {
        self.name = name
        self.id = id
    }
    
    func identify() -> String {
        return "\(name)'s ID is \(id)."
    }
}

var testPerson = Person2(name: "Bryce", id: "123789")
testPerson.identify()
