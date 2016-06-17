//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
class Residence {
    var numberOfRooms = 1
}
class Person{
    var residence : Residence?

}

let john = Person()
let roomCount = john.residence?.numberOfRooms
//let room = john.residence!.numberOfRooms

if let rooCount = john.residence?.numberOfRooms{
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

john.residence = Residence()
*/

class Person{
    var residence : Residence?

}

class Room {
    let name : String
    init(name : String){
        self.name = name
    }

}

class Residence {
    var rooms = [Room]()
    var numberOfRooms : Int{
        return rooms.count;
    }

    subscript(i : Int)->Room{
        get{
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }

    func printNumberOfRooms() {
        print("the number of rooms is \(numberOfRooms)")
    }
    var address : Address?
}


class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil {
            return buildingNumber
        } else {
            return nil
        }
    }
}

let john = Person()
let firstRoomName = john.residence?[0].name

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Dave"]?[0]

testScores["Bev"]?[0] += 1
testScores["Bev"]?[0]
testScores["Brian"]?[0] = 72

if let johnStreet = john.residence?.address?.street{
    print("1")
}else{
    print("0")
}


enum VendingMachineError : ErrorType {
    case InvalidSelection
    case InsufficientFunds(required : Double)
    case OutOfStock
}

struct Item {
    var price : Double
    var count : Int
}

var inventory = [
    "Candy Bar": Item(price: 1.25, count: 7),
    "Chips": Item(price: 1.00, count: 4),
    "Pretzels": Item(price: 0.75, count: 11)
]

var amountDeposited = 1.00

func vend(itemNamed name : String) throws {

    guard var item = inventory[name]  else {
        throw VendingMachineError.InvalidSelection
    }

    guard item.count > 0 else{
        throw VendingMachineError.OutOfStock
    }

    if amountDeposited >= item.price {
        amountDeposited -= item.price
        item.count -= 1
        inventory[name] = item
    }else{
        let amountRequired = item.price - amountDeposited
        throw VendingMachineError.InsufficientFunds(required: amountRequired)
    }
}

try vend(itemNamed: "Pretzels")
inventory



let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

//func buyFavoriteSnack(person : String) throws {
//    let snackName = favoriteSnacks[person] ?? "Candy Bar"
//
//    try vend(itemNamed: snackName)
//}
//
//try buyFavoriteSnack("Bob")
//favoriteSnacks
//
//do{
//    try vend(itemNamed: "Candy Bar")
//}catch VendingMachineError.InvalidSelection{
//
//}catch VendingMachineError.OutOfStock{}
//
//func willOnlyThrowTure(value : Bool) throws {
//    if value { throw VendingMachineError.InvalidSelection}
//}
//
//try! willOnlyThrowTure(false)

struct BlackJackCard {
    enum Suit : Character {
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }

    enum Rank : Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first : Int , sencond : Int?
        }
        var values :Values{
            switch self {
            case .Ace:
                return Values(first: 1,sencond: 11)
            case .Jack , .Queen , .King :
                return Values(first: 10 , sencond: nil)
            default:
                return Values(first: self.rawValue , sencond:  nil)
            }
        }

    }

    let rank : Rank , suit : Suit
    var descripition : String{
        var output = "suit is \(suit.rawValue)"
        output += "value is \(rank.values.first)"
        if let sencont = rank.values.sencond{
            output += " or \(sencont)"
        }
        return output

    }

}

var theAce = BlackJackCard(rank: .Ace , suit: .Spades)

print("theAceOfSpades: \(theAce.descripition)")

let heartsSymbol = BlackJackCard.Suit.Hearts.rawValue
heartsSymbol

extension Double{
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 22.2.km
extension String {
    var textString :String{
        return self + "textString"
    }

}

let textS = "123".textString

extension Int{
    func repetings(task:() -> ()) {
//        for _ in 0..<self {
//            task()
//        }
        task()
    }
}

3.repetings({print("hello!")})



extension Int{
    subscript (var digitIndex : Int)->Int{
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            digitIndex -= 1
        }
        decimalBase
        self%10
        return (self/decimalBase)%10

    }
}

987654321[2]


extension Int{
    enum Kind {
        case Negative ,Zero, Positive
    }
    var kind : Kind{
        switch self {
        case 0:
            return .Zero
        case let x where x > 0 :
            return .Positive

        default:
            return .Negative
        }
    }

}


func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            //print("- ",terminator:"")
            print("- ", separator:"", terminator: "")
        case .Zero:
            print("0 ",terminator:"")
        case .Positive:
            print("+ ",terminator:"")
        }
    }
 
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])

print()

print("...1","...2", separator: "/", terminator: "")

print("...2", separator: "/", terminator: "")






























