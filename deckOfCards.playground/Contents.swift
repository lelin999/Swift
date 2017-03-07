//: Playground - noun: a place where people can play

import UIKit

struct Card {
    var value: String
    var Suit: String
    var numerical_value: Int
    init(value: String, Suit: String, numerical_value: Int) {
        self.value = value
        self.Suit = Suit
        self.numerical_value = numerical_value
    }
}

var standardDeck: [Card] = []
let valueArr = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
let suitArr = ["Clubs", "Spades", "Hearts", "Diamonds"]
let numericalArr = [1,2,3,4,5,6,7,8,9,10,11,12,13]

for suit in suitArr {
    for i in 0..<valueArr.count {
        standardDeck.append(Card(value: valueArr[i], Suit: suit, numerical_value: numericalArr[i]))
    }
}

class Deck {
    var cards: [Card]
    init(cards: [Card] = standardDeck){
        self.cards = cards
    }
    func deal() -> Card {
        return self.cards.remove(at: self.cards.count - 1)
    }
    func reset() -> Deck {
        self.cards = standardDeck
        return(self)
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
    func draw(deck: Deck) -> [Card] {
        self.hand.append(deck.deal())
        return(self.hand)
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
