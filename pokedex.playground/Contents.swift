//: Playground - noun: a place where people can play

import UIKit

var optionalString : String?  = "100"
let convertedNumber = Int(optionalString!)

//Observers
class TestObserver {
    var valueToObserve: String = "empty" {
        willSet(newValue){
            print("About to set valueToObserver to \(newValue)")
            
        }
        
        didSet{
            if oldValue != valueToObserve {
                print("ValueToObserved changed from \"\(oldValue)\" to \"\(valueToObserve)\"")
                self.valueToObserve = "iuli"
            }
        }
        
    }
}


let testObs = TestObserver()
testObs.valueToObserve = "AAA"
print(testObs.valueToObserve)

struct Point{
    var x=0.0, y = 0.0
    
    mutating func moveByX(dX: Double, dY: Double){
        x += dX
        y += dY
    }
}

var p = Point()
p.moveByX(dX: 1, dY: 3)
print(p.x)
print(p.y)

struct Point2{
    var x=0.0, y = 0.0
    
    mutating func moveByX(dX: Double, dY: Double){
        self.x += dX
        self.y += dY
    }
}

print("-----------------------------")
var p2 = Point2()
p2.moveByX(dX: 6, dY: 7)
print(p2.x)
print(p2.y)



let names = ["alan","brian","charlie"]
let csv = names.reduce("===") {text, name in "\(text),\(name)"}
print(csv)
let arrdict = [["name":"poison", "resource_uri":"/api/v1/type/4/"],["name":"grass","resource_uri":"/api/v1/type/12/"]] as [Dictionary<String,String>]
let arr = arrdict.flatMap { $0 }.filter({$0.0 == "name"})
print(arr.map({$0.1}).joined(separator: ","))

["one","two","three"].reduce("",{$0 + $1}) // "onetwothree"


let arrdict1 = [["name":"poison", "resource_uri":"/api/v1/type/4/"],["name":"grass","resource_uri":"/api/v1/type/12/"]] as [Dictionary<String,String>]
let arr1 = arrdict1.flatMap { $0 }.filter({$0.0 == "name"})
print(arr1.map({$0.1}).joined(separator: ","))
func red(t1: (String, String),t2: (String, String))-> String {
    return t1.1
}
print("------------------------Test------------")

print(arr1.reduce("", { return red(t1: $0.1 , t2: $0.1 ) } ))
//(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, (key: String, value: String)) throws -> Result##(Result, (key: String, value: String)) throws -> Result#>)

//arr1.reduce("", { return red( $0 as! (String, String), $1 as! (String, String)) } )

print(arr1)
//let res = arr.0.joined(separator: ",")

//print(res)


