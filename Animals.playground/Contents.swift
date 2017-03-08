//: Playground - noun: a place where people can play

import UIKit

class Animal {
    var name: String
    var hp: Int
    init(name: String, hp: Int = 100) {
        self.name = name
        self.hp = hp
    }
    func displayHealth() -> Animal {
        print (self.hp)
        return self
    }
}

class Cat: Animal {
    override init(name: String, hp: Int = 150) {
        super.init(name: name, hp: hp)
    }
    func growl() -> Cat {
        print ("RAWR!")
        return self
    }
    func run() -> Cat {
        print ("running...")
        self.hp -= 10
        return self
    }
}

class Lion: Cat {
    override init(name: String, hp: Int = 200) {
        super.init(name: name, hp: hp)
    }
    override func growl() -> Lion {
        print ("ROAR!!!!!!! I am King of the Jungle!")
        return self
    }
}

class Cheetah: Cat {
    override func run() -> Cheetah {
        if self.hp > 50 {
            print("Running Faaaaast")
            self.hp -= 50
        }
        return self
    }
    func sleep() -> Cheetah {
        self.hp += 50
        if self.hp > 200 {
            self.hp = 200
        }
        return self
    }
}

var newcheetah = Cheetah(name: "Tom")
newcheetah.run().run().run().run().displayHealth()
var newlion = Lion(name: "Jerry")
newlion.run().run().run().growl().displayHealth()
//Collaborated with Hyo Min Basila and Le