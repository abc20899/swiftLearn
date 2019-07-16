//
//  main.swift
//  swiftLearn
//
//  Created by jun zhao on 2019/7/15.
//  Copyright © 2019 jun zhao. All rights reserved.
//

import Foundation
print("Hello, World!")

/////////////////////////变量常量/////////////////////////
func test(){
    let message = "hello world" //let 声明常量
    var a:String //声明变量
    a = "aaa"
    print(message)
}
test()

/////////////////////////数据类型/////////////////////////
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

///////////////////////////////运算符/////////////////////////////
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

///////////////////////////////函数/////////////////////////////
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
