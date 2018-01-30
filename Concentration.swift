//
//  Concentration.swift
//  Idv1
//
//  Created by Chetan Mahajan on 1/28/18.
//  Copyright © 2018 Chetan Mahajan. All rights reserved.
//

import Foundation
class Concentration {
    private(set) var cards = [Card]()
    private var ifAndOnlyOneFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index): chosen index is not in the cards." )
        if !cards[index].isMatched {
            if let matchIndex = ifAndOnlyOneFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else {
                ifAndOnlyOneFaceUpCard = index
            }
        }
    }
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards): you must have atleast one pair of cards.")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
            
        }
        
        // TODO: Shuffle the cards
        //func shuffle() {
//            for index in cards.indices {
//
//                let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
//                let tmp = cards[randomIndex]
//                cards[index] = cards[randomIndex]
//                cards[randomIndex] = tmp
//
//            }
        //}
        
    }
}
