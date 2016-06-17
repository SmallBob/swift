//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var str1:String = "welcome to string"

var sInt:Int = 122

sInt = 11

str1 = "100"

let letStr = "letstr"

let sum = str1 + String(sInt)
let sumInt = sInt + Int(str1)!
print(sumInt)

typealias AudioSample = UInt16
let uint16 = AudioSample.max


let http404Error = (404,"not found","today")
http404Error.0
http404Error.1
http404Error.2

var http200Status = (statusCode: 200 , description : "0k")
http200Status.statusCode
http200Status.description

let (statusCode , _ ) = http200Status

http200Status.0 = 201
http200Status.1 = "unKonwn"


var point  = (x:0,y:0)

switch point {
case (0,0):
    print("在原点")
    break;
case (_,0):
    print("在x轴上")
    break
case(0,_):
    print("在y轴上")
case(-2...2,-2...2):
    print("在4*4的矩阵内")
default:
    print("在4*4的矩阵外")
}

let onePoint = (1,1)

switch onePoint {
case (0,0):
    print("在原点")
break;
case (_,0):
    print("在x轴上")
    break;
case (0,_):
    print("在y轴上")
    break;
case (-2...2,-2...2):
    print("zai 4*4")
    break;

default :
    break;

}

let anotherPoint  = (1,-1)
switch anotherPoint
{
case (let x , 0):
    print("x")
    break;
case (0 , let y):
    print("y")
    break;

case let (x , y) where x == y:
    print("x==y")
    break;
case let (x , y) where x == -y:
    print("x== -y")
    break;
default :
    break;
}

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

var serverCode : Int? = 2
serverCode = nil

var stringa : String?
stringa = "111"

if convertedNumber != nil {
    print("convertedNumber has \(convertedNumber)")

}

func canThrowAnErrow() throws {
    // 这个函数有可能抛出错误
}

func canErrow() throws {

}

do {
    try canThrowAnErrow()
    print("0k")
}catch {
    print("aaa")
}

let age = 5
assert(age >= 0, "A person's age cannot be less than zero")

assert(age >= 0)

let asString : String?

assert(asString!.isEmpty , "111")

let ageIf = age < 0 ? 10 : 11

for index in 1...5{
    print(index)
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for index in 0 ..< count {
    print("第 \(index + 1) 个人叫 \(names[index]) ")
}

var emptyStrin = ""
var anotherEmpthString = String()
if emptyStrin.isEmpty {
    print("Nothing to see here")
}

var varableString = "Horse"
varableString += " and carriage"

var constantString = "Highlander"
constantString += " and another Highlander"

for character in "Dog!🐶".characters {
    print(character)
}

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)

print(catString)

let heart = "\u{2664}"

let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

let unusualMenagerie = "Koala 🐨"
unusualMenagerie.characters.count

let strrr : NSString = NSString(string: "asdfsadf")
strrr.length

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]

let index = greeting.startIndex.advancedBy(4)
greeting[index]

var welcome = "hello"
welcome.insert("!", atIndex: welcome.endIndex)
welcome.insertContentsOf(" there".characters, at: welcome.endIndex.predecessor())
welcome.removeAtIndex(welcome.endIndex.predecessor())
let range = welcome.endIndex.advancedBy(-6)..<welcome.endIndex
welcome.removeRange(range)

let quotation     = "We're a lot alike, you and I."
let sameQuotation = "We're a  lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}else{
    print("!=")
}

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet{
    if scene.hasPrefix("Act 1 "){
        act1SceneCount += 1
    }
}

print(act1SceneCount)
let dogString = "Dog‼🐶"
for codeUnit in dogString.utf8{
    print(codeUnit)
}

var someInts = [Int]()
someInts.append(3)
someInts = []

var threeDoubles = [Double](count: 3, repeatedValue:0.0)
var threeFloat = [Float](count:3 , repeatedValue : 1.1)

var anotherThreeDoubles = Array(count : 3 , repeatedValue : 1.1)
anotherThreeDoubles.enumerate()

var  letters = Set<Character>()

letters.insert("a")

var favoriteGenres : Set<String> = ["Rock", "Classical", "Hip hop"]

for genre in favoriteGenres.sort()  {
    print(genre)
}

favoriteGenres.sort()

var namesOfIntegers = [:]//[Int : String]()

if #available(iOS 9, OSX 10.10, *)
{
    print("ios 9")
}else{
    print("ios 8")
}

func sayHello(personName : String) -> String {
    let greeting = "Hello, " + personName + " !"
    return greeting;
}

let sayh = sayHello("wangkai")
sayh

func haltOpenrangeLength(start : Int , end : Int) -> Int {
    return end - start
}

print(haltOpenrangeLength(10, end: 10))

func sayHelloAgain(personName : String) -> String {
    return "Hello again , " + personName + "!"
}

func sayHelloGo(personName : String , alreadyGreeted : Bool) -> String {
    if alreadyGreeted {
        return sayHelloAgain(personName)
    }else {
        return sayHello(personName)
    }
}

print(sayHelloGo("wangkai", alreadyGreeted: true))

func someFunction(firstParameterName : Int , _ secondParameterName : Int)  {

}

someFunction(10, 11)

func someFunctiona(external localpara : Int) {

}

someFunctiona(external: 10)

func aritheticMean(numbers : Double...) -> Double {
    var total : Double = 0
    for number in numbers{
        total += number
    }
    return total / Double(numbers.count)
}

aritheticMean(1,2,3,4)
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
var mathFunction : (Int,Int)-> Int = addTwoInts


func printMathResult(mathFunction : (Int ,Int) -> Int , _ a : Int , _ b : Int){
     print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)



let number : Int = 1
number




















