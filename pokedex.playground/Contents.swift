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
