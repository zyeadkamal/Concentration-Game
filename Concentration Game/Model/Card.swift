//
//  Card.swift
//  Concentration Game
//
//  Created by zeyad on 6/21/21.
//

import Foundation

struct Card: Hashable
{
    func hash(into hasher: inout Hasher) {
         hasher.combine(identifier)
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool{
        return lhs.identifier == rhs.identifier
    }
    var isFacedUp = false
    var IsMatched = false
    private var identifier : Int
    
    private static var identifierFactory = 0
    private static func getUniqeIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    init(){
        self.identifier = Card.getUniqeIdentifier()
    }
}
