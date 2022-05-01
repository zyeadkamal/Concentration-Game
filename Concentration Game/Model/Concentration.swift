//
//  Concentration.swift
//  Concentration Game
//
//  Created by zeyad on 6/21/21.
//

import Foundation

struct Concentration
{
    private(set) var cards = [Card]()
    
     private var indexOfONeAndOnlyFacedUp : Int? {
        get{
            
            return cards.indices.filter{cards[$0].isFacedUp}.oneAndOnly
        }
        set{
            for index in cards.indices{
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    
    mutating func choseCard(at index: Int){
        assert(cards.indices.contains(index), "Concntration.choseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].IsMatched{
            // IF one card is faced up and need to match
            if let matchIndex = indexOfONeAndOnlyFacedUp, matchIndex != index{
                if cards[matchIndex] == cards[index]{
                    cards[matchIndex].IsMatched = true
                    cards[index].IsMatched = true
                }
                cards[index].isFacedUp = true
            }else{
                indexOfONeAndOnlyFacedUp = index
            }
        }
    }
    
    mutating func resetCards(){
        for index in cards.indices{
            cards[index].IsMatched = false
            cards[index].isFacedUp = false
        }
        cards.shuffle()
        indexOfONeAndOnlyFacedUp = nil
    }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Concntration.init(at: \(numberOfPairsOfCards)): ypu must have at least onr pair of card")
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}

extension Collection {
    var oneAndOnly : Element? {
        return count == 1 ? first : nil
    }
}

