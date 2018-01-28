//
//  Concentration.swift
//  Idv1
//
//  Created by Chetan Mahajan on 1/28/18.
//  Copyright © 2018 Chetan Mahajan. All rights reserved.
//

import Foundation
class Concentration {
    var cards = [Card]()
    var ifAndOnlyOneFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        
        if !cards[index].isMatched {
            if let matchIndex = ifAndOnlyOneFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                ifAndOnlyOneFaceUpCard = nil
                cards[index].isFaceUp = true
            }else {
                for ind in cards.indices {
                    cards[ind].isFaceUp = false
                }
                ifAndOnlyOneFaceUpCard = index
                cards[index].isFaceUp = true
            }
        }
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            //As the card is a struct this assignment below would create a copy of the Card defined previously.
//            let matchingCard = card
//            cards.append(card)
//            cards.append(matchingCard)
            
            
            //Instead of doing what we are doing above we can create a directly add the card and put it in the array because appending in array or deleting from an array also creates a copy. The reason is as we are passing on structs copies are created so this time 3 copies are there one for the original and two for the append methods.
            cards.append(card)
            cards.append(card)
            
        }
        
        // TODO: Shuffle the cards
        
    }
}
