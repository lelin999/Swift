//: Playground - noun: a place where people can play

import UIKit

for i in 1...255 {
    print(i)
}

for i in 1...100 {
    if (i % 3 == 0 || i % 5 == 0) && !(i % 3 == 0 && i % 5 == 0) {
        print (i)
    }
}

func fizzbuzz(num: Int) {
    if (num % 3 == 0 && num % 5 == 0) {
        print ("FizzBuzz")
    } else if (num % 3 == 0) {
        print ("Fizz")
    } else if (num % 5 == 0) {
        print ("Buzz")
    }
}
