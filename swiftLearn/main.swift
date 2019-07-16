//
//  main.swift
//  swiftLearn
//
//  Created by jun zhao on 2019/7/15.
//  Copyright © 2019 jun zhao. All rights reserved.
//

//https://www.runoob.com/swift/
import Foundation
print("Hello, World!")

/////////////////////////变量常量///////////////////////////////////////////
func test(){
    let message = "hello world" //let 声明常量
    var a:String //声明变量
    a = "aaa"
    print(message)
}
test()

/////////////////////////数据类型/////////////////////////////////////////////////////////////
/**
 Int
 Int8       -128-127
 UInt8      0-255
 Int32
 UInt32
 Int64
 UInt64
 Float
 Double
 Bool
 String
 Character
 元组 ()
 */
var flag:Bool = false
print(flag)
//typealias name = type  别名用法
typealias Feet = Int
let distance:Feet = 100
print(distance)

//可选(Optionals)类型
//var optionalInteger: Int?
//var optionalInteger: Optional<Int>
var myString:String? = nil;
if myString != nil{
    print(myString);
}else{
    print("字符串为 nil");
}
myString = "hello swift";
if myString != nil{
    print(myString); //输出Optional("hello swift")
}else{
    print("字符串为 nil");
}
//强制解析可选值，使用感叹号（!）
if myString != nil {
    print(myString!) //强制解析  hello swift
}else{
    print("myString 值为 nil")
}
//自动解析 你可以在声明可选变量时使用感叹号（!）替换问号（?）
//var myString:String!

//可选绑定
//使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量
func test2(){
    var myString:String?
    myString = "Hello, Swift!"
    if let yourString = myString {
        print("你的字符串值为 - \(yourString)")
    }else{
        print("你的字符串没有值")
    }
}
test2()

//字符串类型
func test5(){
    var abc = String("abc")
    var efg = String("efg");
    //字符串是否为空
    if abc.isEmpty {
        print("")
    }else{
        //字符串长度
        print(abc.count)
    }
    if abc == efg {
        print("相等")
    }else{
        print("不相等")
    }
    //字符串拼接
    efg += "ssss"
    var url = NSString("http://www/ss/")
    var urlArr = url.components(separatedBy: "/")
    print(urlArr)
}
test5()

//###字符类型
var cA:String = "hello "
var cB:Character = "G"
cA.append(cB)
print("cA: \(cA)")
//###遍历字符串中的f字符
for ch in cA {
    print(ch)
}

//###数组
var intArr:[Int] = [1,2,3]
for i in intArr{
    print("i : \(i)")
}
var bArr = [Int]()
bArr.append(1)
bArr.append(2)
bArr.append(3)

var someStrs = [String]()
someStrs.append("Apple")
someStrs.append("Amazon")
someStrs.append("Runoob")
someStrs += ["Google"]
for (index, item) in someStrs.enumerated() {
    print("在 index = \(index) 位置上的值为 \(item)")
}

//###字典
var someDict = [Int: String]()
var dict1:[Int:String] = [1:"a",2:"b",3:"c"]
dict1.updateValue("abb", forKey: 1) //修改值
for dic in dict1{
    print(dic) //(key: 2, value: "b")
}
for (key,value) in dict1{
    print("key:\(key) value:\(value)")
}
var keys:[Int] = [Int](dict1.keys)  //转为数组

///////////////////////////////运算符/////////////////////////////////////////////////////////////////
//区间运算...   ..<半开区间
func test3(){
    for index in 1...5 {
        print("\(index) * 5 is \(index * 5)")
    }
    for index in 1..<5 {
        print("\(index) * 5 is \(index * 5)")
    }
}
test3()

//三元运算符 ?:
print(5 > 3 ?"1":"0")

//循环
func test4(){
    var index = 15
    repeat{
        print( "index 的值为 \(index)")
        index = index + 1
    }while index < 20
}
test4()

///////////////////////////////函数///////////////////////////////////////////////////////////////////////
func sum(a:Int,b:Int)->Int{
    return a+b;
}
print(sum(a: 2, b: 3))

//元组作为函数返回值
//元组与数组类似，不同的是，元组中的元素可以是任意类型，使用的是圆括号
func minMax(array:[Int])->(min:Int,max:Int)?{
    if array.isEmpty { return nil }
    var tempMin = array[0];
    var tempMax = array[0];
    for value in array {
        if value < tempMin{
            tempMin = value
        }else if value > tempMax{
           tempMax = value
        }
    }
    return (tempMin,tempMax)
}
//如果你提供了外部参数名array，那么函数在被调用时，必须使用外部参数名。
let bounds = minMax(array:[8, -6, 2, 109, 3, 71])
print(bounds)

//可以变参数
func vari(numbers:String...){
    for i in numbers{
        print(i)
    }
}
vari(numbers:"a","b","c")

//引用传递
//一般默认的参数传递都是传值调用的，而不是传引用。所以传入的参数在函数内改变，并不影响原来的那个参数
//_ 外部参数名可以忽略
func swapTwoIns(_ a: inout Int,_ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}
var x = 1
var y = 5
swapTwoIns(&x,&y)
print("x: \(x)  y: \(y)") //x: 5  y: 1

//函数类型
var addition: (Int, Int) -> Int = sum  // sum实现
print(addition(2,3))

//函数嵌套
//forDecrement 外部参数名
func calcDecrement(forDecrement total:Int)->()->Int{ //返回()->Int类型
    var overallDecrement = 0
    func decrementer()->Int{
        overallDecrement -= total
        return overallDecrement
    }
    return decrementer
}
let decrem = calcDecrement(forDecrement: 30)
print(decrem())

//闭包函数
/**
 {(parameters) -> return type in
   statements
 }
*/
let printName = {print("闭包函数")}
printName()

let sumMethod = {
    (a:Int,b:Int)->Int in
    return a+b
}
print(sumMethod(2,3))

//闭包表达式
let names = ["AT", "AE", "D", "S", "BE"]
// 使用普通函数(或内嵌函数)提供排序功能,闭包函数类型需为(String, String) -> Bool。
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sorted(by: backwards)
//使用参数名称缩写 $0  $1
var reversed2 = names.sorted( by: { $0 > $1 } )
//运算符函数
//Swift 的String类型定义了关于大于号 (>) 的字符串实现，其作为一个函数接受两个String类型的参数并返回Bool类型的值。 而这正好与sort(_:)方法的第二个参数需要的函数类型相符合。 因此，您可以简单地传递一个大于号
var reversed3 = names.sorted(by: >)
//尾随闭包 尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。
var reversed4 = names.sorted() { $0 > $1 }
print(reversed)
print(reversed2)

//###捕获值 闭包是引用类型
//由于没有修改amount变量，incrementor实际上捕获并存储了该变量的一个副本，而该副本随着incrementor一同被存储。
//所以我们调用这个函数时会累加：
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}
let incrementByTen = makeIncrementor(forIncrement: 10)
// 返回的值为10
print(incrementByTen())
// 返回的值为20
print(incrementByTen())
// 返回的值为30
print(incrementByTen())

///////////////////////////////枚举///////////////////////////////////////////////////////////////////////
enum Student{
    case Name(String)
    case Mark(Int,Int,Int)
}
var studDetails = Student.Name("Runoob")
var studMarks = Student.Mark(98,97,95)
switch studMarks {
case .Name(let studName):
    print("学生的名字是: \(studName)。")
case .Mark(let Mark1, let Mark2, let Mark3):
    print("学生的成绩是: \(Mark1),\(Mark2),\(Mark3)。")
}

// 定义枚举
enum DaysofaWeek {
    case Sunday
    case Monday
    case TUESDAY
    case WEDNESDAY
    case THURSDAY
    case FRIDAY
    case Saturday
}

var weekDay = DaysofaWeek.THURSDAY
weekDay = .THURSDAY
switch weekDay
{
case .Sunday:
    print("星期天")
case .Monday:
    print("星期一")
case .TUESDAY:
    print("星期二")
case .WEDNESDAY:
    print("星期三")
case .THURSDAY:
    print("星期四")
case .FRIDAY:
    print("星期五")
case .Saturday:
    print("星期六")
}

///////////////////////////////结构体///////////////////////////////////////////////////////////////////////
//### 结构体
//结构体的主要目的是用来封装少量相关简单数据值。
//任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用。
struct markStruct{
    var mark1: Int
    var mark2: Int
    var mark3: Int
    
    init(mark1: Int, mark2: Int, mark3: Int){
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
    }
}

print("优异成绩:")
var marks = markStruct(mark1: 98, mark2: 96, mark3:100)
print(marks.mark1)
print(marks.mark2)
print(marks.mark3)

print("糟糕成绩:")
var fail = markStruct(mark1: 34, mark2: 42, mark3: 13)
print(fail.mark1)
print(fail.mark2)
print(fail.mark3)

///////////////////////////////类///////////////////////////////////////////////////////////////////////
//###类 必须初始化init
class studentClass{
    var studname: String
    var mark: Int
    var mark2: Int
    init(studname: String,mark: Int,mark2: Int) {
        self.studname = studname
        self.mark = mark
        self.mark2 = mark2
    }
}
let studrecord = studentClass(studname:"yang",mark:10,mark2:10)

//恒等运算符
//因为类是引用类型，有可能有多个常量和变量在后台同时引用某一个类实例。
//为了能够判定两个常量或者变量是否引用同一个类实例，Swift 内建了两个恒等运算符：=== !==
class SampleClass: Equatable {
    let myProperty: String
    init(s: String) {
        myProperty = s
    }
}
func ==(lhs: SampleClass, rhs: SampleClass) -> Bool {
    return lhs.myProperty == rhs.myProperty
}

let spClass1 = SampleClass(s: "Hello")
let spClass2 = SampleClass(s: "Hello")

if spClass1 === spClass2 {// false
    print("引用相同的类实例 \(spClass1)")
}

if spClass1 !== spClass2 {// true
    print("引用不相同的类实例 \(spClass2)")
}

//计算属性 存储属性
class sample {
    var no1 = 0.0, no2 = 0.0
    var length = 300.0, breadth = 150.0
    
    var middle: (Double, Double) {
        get{
            return (length / 2, breadth / 2)
        }
        set(axis){
            no1 = axis.0 - (length / 2)
            no2 = axis.1 - (breadth / 2)
        }
    }
}

var result = sample()
print(result.middle) //get方法
result.middle = (0.0, 10.0) //set方法 元组类型

print(result.no1)
print(result.no2)

//只读计算属性
class film {
    var head = ""
    var duration = 0.0
    var metaInfo: [String:String] {
        return [
            "head": self.head,
            "duration":"\(self.duration)"
        ]
    }
}

var movie = film()
movie.head = "Swift 属性"
movie.duration = 3.09

print(movie.metaInfo["head"]!)
print(movie.metaInfo["duration"]!)

//可以为属性添加如下的一个或全部观察器：
//willSet在设置新的值之前调用
//didSet在新的值被设置之后立即调用
//willSet和didSet观察器在属性初始化过程中不会被调用
class Samplepgm {
    var counter: Int = 0{
        willSet(newTotal){
            print("计数器: \(newTotal)")
        }
        didSet{
            if counter > oldValue {
                print("新增数 \(counter - oldValue)")
            }
        }
    }
}
let NewCounter = Samplepgm()
NewCounter.counter = 100
NewCounter.counter = 800

//类属性 static
struct StudMarks {
    static let markCount = 97
    static var totalCount = 0
    var InternalMarks: Int = 0 {
        didSet {
            if InternalMarks > StudMarks.markCount {
                InternalMarks = StudMarks.markCount
            }
            if InternalMarks > StudMarks.totalCount {
                StudMarks.totalCount = InternalMarks
            }
        }
    }
}

//实例方法
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
// 初始计数值是0
let counter = Counter()
// 计数值现在是1
counter.increment()
// 计数值现在是6
counter.incrementBy(amount: 5)
print(counter.count)
// 计数值现在是0
counter.reset()
print(counter.count)

//self属性
class calculations {
    let a: Int
    let b: Int
    let res: Int
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
        res = a + b
        print("Self 内: \(res)")
    }
    
    func tot(c: Int) -> Int {
        return res - c
    }
    
    func result() {
        print("结果为: \(tot(c: 20))")
        print("结果为: \(tot(c: 50))")
    }
}

let pri = calculations(a: 600, b: 300)
let sum = calculations(a: 1200, b: 300)

pri.result()
sum.result()

//方法变异
struct area {
    var length = 1
    var breadth = 1
    
    func area() -> Int {
        return length * breadth
    }
    
    mutating func scaleBy(res: Int) {
        length *= res
        breadth *= res
        print(length)
        print(breadth)
    }
}

var val = area(length: 3, breadth: 5)
val.scaleBy(res: 3)
val.scaleBy(res: 30)
val.scaleBy(res: 300)

//类方法
class Math{
    class func abs(number: Int) -> Int{
        if number < 0{
            return (-number)
        }
        else{
            return number
        }
    }
}

struct absno{
    static func abs(number: Int) -> Int{
        if number < 0{
            return (-number)
        }
        else{
            return number
        }
    }
}
let no = Math.abs(number: -35)
let num = absno.abs(number: -5)
print(no)
print(num)

//下标脚本
//下标脚本允许你通过在实例后面的方括号中传入一个或者多个的索引值来对实例进行访问和赋值。
/**
 subscript(index: Int) -> Int {
     get {
          // 用于下标脚本值的声明
     }
     set(newValue) {
         // 执行赋值操作
     }
 }
 */
struct subexample {
    let decrementer: Int
    //下标脚本
    subscript(index: Int) -> Int {
        return decrementer / index
    }
}
let division = subexample(decrementer: 100)
print("100 除以 9 等于 \(division[9])")
print("100 除以 2 等于 \(division[2])")
print("100 除以 3 等于 \(division[3])")
print("100 除以 5 等于 \(division[5])")
print("100 除以 7 等于 \(division[7])")

class daysofaweek {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
                        "Thursday", "Friday", "saturday"]
    subscript(index: Int) -> String {
        get {
            return days[index]   // 声明下标脚本的值
        }
        set(newValue) {
            self.days[index] = newValue   // 执行赋值操作
        }
    }
}
var p = daysofaweek()
print(p[0])
print(p[1])
print(p[2])
print(p[3])

//下标选项
struct Matrix {
    let rows: Int, columns: Int
    var print: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        print = Array(repeating: 0.0, count: rows * columns)
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            return print[(row * columns) + column]
        }
        set {
            print[(row * columns) + column] = newValue
        }
    }
}
// 创建了一个新的 3 行 3 列的Matrix实例
var mat = Matrix(rows: 3, columns: 3)

// 通过下标脚本设置值
mat[0,0] = 1.0
mat[0,1] = 2.0
mat[1,0] = 3.0
mat[1,1] = 5.0

// 通过下标脚本获取值
print("\(mat[0,0])")
print("\(mat[0,1])")
print("\(mat[1,0])")
print("\(mat[1,1])")

//继承
class StudDetails{
    var mark1: Int;
    var mark2: Int;
    
    init(stm1:Int, results stm2:Int){
        mark1 = stm1;
        mark2 = stm2;
    }
    
    func show(){
        print("Mark1:\(self.mark1), Mark2:\(self.mark2)")
    }
}

class Tom : StudDetails{
    init(){
        super.init(stm1: 93, results: 89)
    }
}
let tom = Tom()
tom.show()

//重写
class SuperClass {
    func show() {
        print("这是超类 SuperClass")
    }
}

class SubClass: SuperClass  {
    override func show() {
        print("这是子类 SubClass")
    }
}

//防止重写
final class Circle {
    final var radius = 12.5
    var area: String {
        return "矩形半径为 \(radius) "
    }
}

//类型转换  as?
