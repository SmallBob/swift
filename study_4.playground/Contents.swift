//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//class Person {
//    let  name : String
//    init(name : String){
//        self.name = name
//    }
//    var apartment : Apartment?
//    deinit{
//        print("\(name) is being deinitialized")
//    }
//}
//
//class Apartment {
//    let number : Int
//    init(number : Int){
//        self.number = number
//    }
//     var tenant : Person?
//     deinit { print("Apartment #\(number) is being deinitialized") }
//}
//
//var john : Person?
//var number73 : Apartment?
//
//john = Person(name : "john")
//number73 = Apartment(number : 73)
//
//john!.apartment = number73
//
//number73!.tenant = john
//
//john = nil
//number73 = nil
//
////john!.apartment!
//
//class Customer {
//    let name : String
//    var card : CreditCard?
//
//    init(name : String){
//        self.name = name
//    }
//    deinit { print("\(name) is being deinitialized") }
//}
//
//class CreditCard {
//    let number : UInt64
//    unowned let customer : Customer
//    init(number : UInt64 , customer : Customer){
//        self.number = number
//        self.customer = customer
//    }
//     deinit { print("Card #\(number) is being deinitialized") }
//}
//
//var bob : Customer?
//bob = Customer(name : "bob")
//bob!.card = CreditCard(number: 123456789 , customer: bob!)
//
//bob = nil

class Person {
    var residence : Residence?
    var name : String?

}

class Residence {
    var numberOfRooms = 1

}

let john = Person()
let roomCount = john.name



































