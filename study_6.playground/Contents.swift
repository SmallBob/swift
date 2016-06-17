//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol Someprotocol {
    var mustBeSettable : Int{
        get set
    }
    var doesNotNeedToBeSettable : Int{get}

}

protocol AnotherProtocol {
    static var someTyepProperty : Int{ get  set}
}

protocol FullyNamed {
    var fullName :String{get }

}

struct Person:FullyNamed {
    var  fullName: String


}
let  john = Person(fullName: "john")

class Starship : FullyNamed {
    var preifx :String?
    var name  : String
    init(name : String , preifx : String? = nil ){
        self.name = name
        self.preifx = preifx
    }
    var fullName: String {
        return (preifx != nil ? preifx! + " " : " ") + name
    }


}


var ncc = Starship(name : "bob" , preifx: "wang")
ncc.fullName

func swapTwoValues<T>(inout a : T , inout _ b : T ) -> () {
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 34
swap(&someInt, &anotherInt)
someInt

var someString = "hello"
var otherString = "world"
swap(&someString, &otherString)
someString

struct IntStruct {
    var items = [Int]()
    mutating func push(item : Int){
        items.append(item)
    }
    mutating func pop()->Int{
        return items.removeLast()
    }

}

struct Stack <T> {
    var items = [T]()
    mutating func push(item : T){
        return items.append(item)
    }
    mutating func pop()->T{
        return items.removeLast()
    }

}

var staackOfStrings = Stack<String>()
staackOfStrings.push("uno")
staackOfStrings.push("dos")
staackOfStrings.push("tres")
staackOfStrings.push("cuatro")
let fromTheTop = staackOfStrings.pop()

















