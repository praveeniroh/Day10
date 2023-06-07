import Cocoa

struct BankAccount {
    let accountNumber: String
    var balance: Double

    mutating func deposit(amount: Double) {
        balance += amount
    }

    mutating func withdraw(amount: Double) {
        if balance >= amount {
            balance -= amount
        } else {
            print("Insufficient balance.")
        }
    }
}


let account1 = BankAccount(accountNumber: "123123", balance: 56)//Memberwise Initializers
print(account1.accountNumber)

struct DevEmployee{
    var mail:String
    let department = "Dev"
    
    mutating func updateMail(newMail:String){
        mail = newMail
    }
}
let devEmp = DevEmployee(mail: "a@a.com")//Memberwise Initializers created only for Var (department already have value)

struct Employee{
    let id:Int
    var department = "Trainee"
    
    mutating func updateDepartment(newDep:String){
        department = newDep
    }
}
let emp1 = Employee(id: 100)//Memberwise init 1
let emp2 = Employee(id: 101, department: "Management")//memberwise init 2

//value types

var emp3 = emp1
emp3.department = "Dev"
print("emp1 : \(emp1.department)")
print("emp3 : \(emp3.department)")

//stored and computed properties
struct MyBankAccount {
    var balance: Double

    var formattedBalance: String {
        return String(format: "$%.2f", balance)
    }

    var currentBalance: Double {
        get {
            return balance
        }
        set {
            balance = max(0, newValue)
        }
    }
}

var myAccount = MyBankAccount(balance: 100.0)
print("Current Balance: \(myAccount.currentBalance)")

myAccount.currentBalance = -50.0
print("Current Balance: \(myAccount.currentBalance)")

myAccount.currentBalance = 250.0
print("Current Balance: \(myAccount.currentBalance)")
print("Formatted Balance: \(myAccount.formattedBalance)")

//property observers
struct Circle {
    var radius: Double {
        willSet(newRadius) {
            print("Going  to change radius to \(newRadius)")
        }
        didSet(oldRadius) {
            print("Radius changed from \(oldRadius) to \(radius)")
        }
    }
}

var myCircle = Circle (radius: 3)
myCircle.radius = 5.0

//custom init
struct Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    init(name: String) {
        self.name = name
        self.age = 0
    }

    init() {
        self.name = "Unknown"
        self.age = 0
    }
}

let john = Person(name: "John", age: 30)
print(john.name)
print(john.age)
let jane = Person(name: "Jane")
print(jane.name)
print(jane.age)

let unknownPerson = Person()
print(unknownPerson.name)
print(unknownPerson.age)
