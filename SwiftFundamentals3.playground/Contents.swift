//: Playground - noun: a place where people can play

import UIKit

var arr = [Int]()
for num in 1...255 {
    arr.append(num)
}
for i in 1...100 {
    var rand1 = Int(arc4random_uniform(255))
    var rand2 = Int(arc4random_uniform(255))
    
    if rand1 != rand2 {
        var temp = arr[rand1]
        arr[rand1] = arr[rand2]
        arr[rand2] = temp
    }
}


for i in 0..<arr.count {
    if arr[i] == 42 {
        arr.remove(at: i)
        print("We found the answer to the Ultimate Question of Life, the Universe, and Everything at index \(i)")
        break
    }
}
