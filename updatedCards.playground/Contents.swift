//: Playground - noun: a place where people can play

import UIKit

struct Card {
    var value: String
    var Suit: String
    var numerical_value: Int
}

class Deck {
    var cards = [Card]()
    func reset() {
        let valueArr = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        let suitArr = ["Clubs", "Spades", "Hearts", "Diamonds"]
        let numericalArr = [1,2,3,4,5,6,7,8,9,10,11,12,13]
        for suit in suitArr {
            for i in 0..<valueArr.count {
                self.cards.append(Card(value: valueArr[i], Suit: suit, numerical_value: numericalArr[i]))
            }
        }
    }
    init() {
        self.reset()
    }
    func deal() -> Card? {
        if self.cards.count > 0 {
            return self.cards.remove(at: 0)
        }
        else {
            return nil
        }
    }
    func shuffle() -> Deck {
        for _ in 1...1000{
            let rand1 = Int(arc4random_uniform(UInt32(self.cards.count - 1)))
            let rand2 = Int(arc4random_uniform(UInt32(self.cards.count - 1)))
            if rand1 != rand2 {
                swap(&self.cards[rand1],&self.cards[rand2])
            }
        }
        return(self)
    }
}

class Player {
    var name: String
    var hand: [Card]
    init(name: String, hand: [Card]) {
        self.name = name
        self.hand = hand
    }
    func draw(deck: Deck) -> Card? {
        if let drawCard = deck.deal() {
            self.hand.append(drawCard)
            return drawCard
        }
        else {
            return nil
        }
    }
    func discard(card: Card) -> Bool {
        for i in 0..<self.hand.count {
            if self.hand[i].value == card.value && self.hand[i].Suit == card.Suit{
                self.hand.remove(at: i)
                return true
            }
        }
        return false
    }
}

