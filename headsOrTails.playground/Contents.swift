//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
func headsOrTails() -> String {
    print ("Tossing a coin!")
    let random = Int(arc4random_uniform(2))
    var res: String
    if random == 1 {
        res = "You got heads!"
    } else {
        res = "You got tails!"
    }
    return res
}

func tossMultipleCoins(num: Int) -> Double {
    var heads = 0
    for _ in 0...num {
        if headsOrTails() == "You got heads!" {
            heads += 1
        }
    }
    return Double(heads) / Double(num)
}