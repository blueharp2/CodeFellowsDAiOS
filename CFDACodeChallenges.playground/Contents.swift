//CODING CHALLENGE: Write a function that reverses an array

import UIKit


var myArray = ["1","2","3"]


func reverseMyArray(myArray : [String]) ->[String] {
    let count = myArray.count
    
    var myArrayReversed = [String]()
 
    for var i = count-1; i >= 0; i-- {
        myArrayReversed.append(myArray[i])
    }
    return myArrayReversed

}

let revesedArray = reverseMyArray(["One","Two", "Three"])

//Thanks to Michael for the help!!!

//Fizz Buzz

for number in 1...100{
  if number % 3 == 0 && number % 5 == 0 {
    print("FizzBuzz")
  } else if number % 5 == 0 {
    print("Buzz")
  } else if number % 3 == 0 {
    print("Fizz")
  } else {
    print(number)
  }
}
