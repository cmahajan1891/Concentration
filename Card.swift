//
//  Card.swift
//  Idv1
//
//  Created by Chetan Mahajan on 1/28/18.
//  Copyright © 2018 Chetan Mahajan. All rights reserved.
//

import Foundation
struct Card {
    var isMatched = false
    var isFaceUp = false
    var identifier : Int
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
