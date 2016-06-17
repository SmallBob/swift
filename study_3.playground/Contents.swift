//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct FixedlengthRange {
    var firstValue : Int
    let  length : Int

}

var rangeOfThreeItems = FixedlengthRange(firstValue: 0, length: 10)

rangeOfThreeItems.firstValue = 6

//rangeOfThreeItems.length = 10

class DataImporter {
    var fileName = "data.txt"
}

class DataManger {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManger()
manager.data.append("some data")
manager.importer.fileName = "data.txt1"

struct Point {
    var x = 0.0,y = 0.0
}

struct Size {
    var width = 0.0 ,height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center : Point{

        get{
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x : centerX , y: centerY)

        }

        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }

    }

}

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center : Point{
        get{
            return Point(x: origin.x + (size.width/2) , y : origin.y + (size.height/2) )
        }

        set {
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
    }

}



struct Cuboid {
    var width = 0.0 ,height = 0.0 , depth = 0.0
    var volume : Double{
        return width*height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0,height: 5.0,depth: 6.0)
fourByFiveByTwo.volume


struct TestPoint {
    var origin = Point()
    var center :Point {
        get {
            return Point(x: origin.x,y: origin.y)
        }

        set {
            origin.x = newValue.x + 10
            origin.y = newValue.y + 100
        }
    }

}


var testPoint = TestPoint()
//testPoint.origin = Point(x: 10,y: 10)
testPoint.center.x

class StepCounter {
    var totalSteps : Int = 0 {
        willSet(newTotalSteps){
            print("About to set totalSteps to \(newTotalSteps)")
        }

        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 300

var name : String? {

willSet {
    print("name : willSet")
}
didSet {
    print("name : didSet")
}

}

class nameTest {
    var name : String = String() {
        willSet {

            print("name : willSet \(name)")
        }
        didSet {
            name = "name"
            print("name : didSet \(name)")
        }
        

    }

}

let nameT = nameTest()
nameT.name = "123"


class People: NSObject {
    var firstName : String = ""
    var lastName : String = ""
    var nickName : String = ""

    //计算属性
    var fullName : String{

        get {

            return nickName + " " + firstName + " " + lastName

        }

        set {

        }
    }
        //带属性监视器
    var age : Int = 0
    {
        willSet{
            print("will set an new value \(newValue) to age")
        }

        didSet{
            print("age filed changed form \(oldValue) to \(age)")
            if age < 10 {
                nickName = "Little"
            } else {
                nickName = "Big"
            }

        }

    }

    func toString() -> String {
        return "Full name : \(fullName) " + " , Age:\(age)"
    }

}


var me = People()
me.firstName = "Zhang"
me.lastName = "San"
me.age = 2
print(me.toString())

struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTyPeProperty : Int{
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty : Int {
        return 6
    }
}

class  SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

SomeStructure.storedTypeProperty = "another value"

class Counter {
    var  count = 0
    func increment()  {
//        self.count += 1
        count += 1
    }
    func incrementBy(amount : Int)  {
        count += amount
    }

    func  reset() {
        count = 0
    }

    func incrementByWith(amount : Int ,st numberOfTimes : Int)  {
        count += amount * numberOfTimes
    }
}

let counter = Counter()
counter.increment()
counter.incrementBy(10)
counter.reset()
counter.incrementByWith(10, st: 11)



struct PointTest {
    var x = 0.0 , y = 0.0
   mutating func moveByX(deltaX : Double , y deltaY : Double)  {
//        x += deltaX
//        y += deltaY
    self = PointTest(x: x + deltaX ,y: y + deltaY)
    }


}

var somePoint = PointTest(x: 1.0 , y: 1.0)
somePoint.moveByX(2, y: 3)

struct LevelTracker {
    static var highesUnlockedLevel = 1
    static func unlockLevel(level : Int) {
        if level > highesUnlockedLevel {
            highesUnlockedLevel = level
        }

    }

    static func levelIsUnlocked(level : Int) -> Bool{
        return level <= highesUnlockedLevel
    }

    var currentLevel = 1
    mutating func advanceToLevel(level : Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        }else{
            return false
        }
    }

}

class Player {
    var tracker = LevelTracker()
    let  playerName : String
    func completedLevel(level : Int)  {
        LevelTracker.unlockLevel(level)
        tracker.advanceToLevel(level)
    }
    init(name : String){
        playerName = name
    }
}

var player = Player(name : "wangkai")
player.completedLevel(6)
print("highest unlocked level is now \(LevelTracker.highesUnlockedLevel)")
LevelTracker.highesUnlockedLevel
LevelTracker.levelIsUnlocked(6)
player.tracker.advanceToLevel(6)


var testArray = Dictionary<Int , String>()

struct TimesTable {
    let multiplier : Int
    subscript(index : Int)->String{
        return "123" + " " + String(multiplier)
    }
}

let threeTimesTable = TimesTable(multiplier:3)

threeTimesTable[6]

struct Matrix {
    let rows : Int , columns : Int
    var grid : [Double]
    init(rows : Int , columns : Int){
        self.rows = rows
        self.columns = columns
        grid = Array(count : rows * columns , repeatedValue : 0.0)
    }
    func indexIsValidForRow(row : Int , column : Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }

    subscript(row : Int , column : Int)->Double{
        get {
            assert(indexIsValidForRow(row, column: column),"index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column) , "index out of range")
            grid[(row * columns) + column] = newValue
        }
    }



}

var matrix = Matrix(rows: 2 , columns: 2)
matrix.grid
matrix[0,1]
matrix[1,0] = 3.2
matrix.grid

class Vehicle {
    var currentSpeed = 0.0
    var description : String {

        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {

    }

}

let someVehicle = Vehicle()
someVehicle.description

final class Bicycle: Vehicle {
    var hasBasket = false
    var gear = 1

    override func makeNoise() {
        print("bicycle ")
    }

    override var description: String
        {
        return super.description + " in gear"
    }

    override var currentSpeed: Double {
        didSet{

           gear = Int(currentSpeed/10.0) + 10
        }
    }
}

let bicycle = Bicycle()
bicycle.currentSpeed = 910
bicycle.description
bicycle.hasBasket
bicycle.makeNoise()
bicycle.gear

//class by: Bicycle {
//
//}

struct Fahrenheit {
    var temp : Double {
        didSet{
            self.temp += 10
            print("temp = \(temp)")
        }
    }

    init(){
        temp = 32
    }
}

var fah = Fahrenheit()
fah.temp
fah.temp = 10

if #available(iOS 9.0 ,  *){
    print("ok")
}else if #available(iOS 8.0,OSX 10.10, *){
    print("8.0")
}else{
    print("other")
}

struct Color {
    let red,green,blue:Double
    init(red : Double , green : Double , blue : Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white : Double){
        red = white
        green = white
        blue = white
    }
}

let color = Color(red: 1,green: 1,blue: 1)
let colorb = Color(red: 2,green: 2,blue: 3)

class SurveyQuestion {
    var text : String
    var response : String?
    init(text : String){
        self.text = text
    }
    func ask()  {
        print(text)
    }

}

var sur = SurveyQuestion(text : "do you like cheese?")
sur.response

struct Recta {
    var origin = Point()
    var size = Size()

    init(){}
    init(origin : Point , size : Size){
        self.origin = origin
        self.size = size
    }

    init(center : Point , size : Size){
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)

        self.init(origin : Point(x: originX, y: originY) , size: size)

    }
}

let basicRect = Recta()
let originRect = Recta(origin: Point(x: 2.0 , y: 3.0) , size : Size(width: 5.0 , height: 5.0))
let centerRect = Recta(center: Point(x: 4.0 , y: 4.0) , size : Size(width: 3.0 , height: 3.0))


class Person {
    var name : String!
    var weight : Double
    init(name : String , weight : Double){
        self.name = name
        self.weight = weight
    }

    convenience init(n name : String , w weight : Double){
        self.init(name : name , weight: weight)
    }

}

class Man: Person {
    var sex : String!
    init(sex : String , name : String , weight : Double){
        self.sex = sex

        super.init(name: name, weight: weight)

    }

    convenience init(s sex : String , n name : String , w weight : Double){
        self.init(sex: "2" , name: name , weight: weight)
    }

}

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name : "bacon")
namedMeat.name

let mysterMeat = Food()
mysterMeat.name

let mannam = Man(s : "a" , n : "c" , w : 11)
mannam.sex

struct Animal {
    let species : String
    init?(species : String){
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

let someCreature = Animal(species : "aa")
if let giraffe = someCreature{
         print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")
// anonymousCreature 的类型是 Animal?, 而不是 Animal

if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

let fahren = TemperatureUnit(symbol : "F")
if fahren != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
// 打印 "This is a defined temperature unit, so initialization succeeded."

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

struct Checkerboard {
    let boardColors : [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard

    }()

    func squareIsBlackAtRow(row : Int , column : Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}

let board = Checkerboard()
print(board.squareIsBlackAtRow(0, column: 3))


struct Bank {
    static var coinsInBank = 10000
    static func vendCoins(var numberOfCoinsToVend : Int)->Int{
        numberOfCoinsToVend = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }

    static func receiveCoins(coins : Int){
        coinsInBank += coins
    }
}

class Playera {
    var coinsInPurse : Int
    init(coins : Int){
        coinsInPurse = Bank.vendCoins(coins)

    }
    func winCoins(coins : Int)  {
        coinsInPurse += Bank.vendCoins(coins)

    }
    deinit {
        Bank.receiveCoins(coinsInPurse)
    }
}

var playerOne : Playera? = Playera(coins : 100)
playerOne!.winCoins(2000)

playerOne = nil
Bank.coinsInBank



















