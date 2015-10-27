//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var hello = [String:AnyObject]()
hello["msg"] = "hello everyone"


var userObject = [String:AnyObject]()
userObject["name"] = "hello world, im duncan"
userObject["helloworld"] = hello
userObject["superPower"] = "flying"

if let hello = userObject["helloworld"] as? [String:AnyObject],
    let msg = hello["msg"] as? String {
    print(msg)
}

if let hello = userObject["helloworld"] as? [String:AnyObject]{
    if let msg = hello["msg"] as? String {
            print(msg)
    }
}



if let stomach = userObject["stomach"] as? [String:AnyObject], let faveFood = stomach["faveFood"] as? String {
    print(faveFood)
}





