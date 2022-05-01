//
//  ViewController.swift
//  Concentration Game
//
//  Created by zeyad on 6/20/21.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards : Int{
        return  (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount = 0{
        didSet {
           
            flipCardLabel.text = "Flips: \(flipCount)"
            
        }
    }
    
    @IBOutlet private weak var flipCardLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            if !game.cards[cardNumber].IsMatched{
                flipCount += 1
            }
            game.choseCard(at: cardNumber)
            updateViewFromModel()
        }else{return}
        
    }
    
    
    @IBAction private func newGamePressed(_ sender: UIButton) {
        game.resetCards()
        self.updateViewFromModel()
        flipCount = 0
        
    }
    
    private func updateViewFromModel(){
        
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                
                button.setTitle("", for: .normal)
                button.backgroundColor = card.IsMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                
            }
        }
    }
    
    private var emojiChoises = "🎃⚡️👻🧭🥰😇🥳🤯🤬🥶"
    
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emojiChoises.count > 0, emoji[card] == nil {
            let randomStringIndex = emojiChoises.index(emojiChoises.startIndex, offsetBy: emojiChoises.count.arc4random)
            emoji[card] = String(emojiChoises.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
}

extension Int{
    var arc4random : Int{
        if self > 0{
        return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
    }
}

