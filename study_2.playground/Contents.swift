//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let names = ["Chris","Alex","Ewa","Barry","Daniella"]
func backwards(s1 : String , s2 : String) -> Bool {
    return s1 > s2
}

var  reversed = names.sort(backwards)

reversed = names.sort({ (s1 : String ,s2 : String) -> Bool in
    return s1 > s2
})

reversed = names.sort({s1,s2 in return s1 > s2})

reversed = names.sort({s1 ,s2 in s1 > s2})

reversed = names.sort({$0 > $1})

reversed = names.sort(<)

func someFunctionThatTakesAClosure(closure : () -> Void)  {

}

func someTest(closure:()->Void) {

}

someFunctionThatTakesAClosure({})

someFunctionThatTakesAClosure(){}

reversed = names.sort(){$0 > $1}

reversed = names.sort(){(s1 : String ,s2 : String) -> Bool in return s1 > s2}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map(){
    (var number) -> String in
    var ouput = ""
    while number > 0{
        ouput = digitNames[number % 10]! + ouput
        number /= 10
    }
    return ouput
}

func makeIncrementor(forIncrement amount : Int)->() -> Int {
    var runningTotal  = 0
    func incrementor()->Int{
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)

incrementByTen()
incrementByTen()
incrementByTen()

let alsoIncrementByTen = incrementByTen()
incrementByTen()

enum CompassPoint {
    case North
    case South
    case East
    case West
}

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune

}

var directionToHead = CompassPoint.West
directionToHead = .East
switch directionToHead{
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}

enum Barcode {
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
let earthOrder = Planet.Earth.hashValue

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var  name : String?

}
let someResolution = Resolution()
let someVideoMode = VideoMode()

someResolution.width
someResolution.height

someVideoMode.resolution
someVideoMode.name

let vga = Resolution(width: 100 ,height: 20)


















