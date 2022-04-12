//
//  Card.swift
//  ToComSorte
//
//  Created by Gustavo Pereira on 10/04/22.
//

import Foundation

class Card: Equatable {
    
    var value: Int
    var suit: CardSuit
    
    init(value: Int, suit: CardSuit) {
        self.value = (value < 1 || value > 13) ? 1 : value
        self.suit = suit
    }
    
    init() {
        let suits: [CardSuit] = [.clubs, .diamonds, .hearts, .spades]
        self.value = Int.random(in: 1...13)
        self.suit = suits[ Int.random(in: 0..<suits.count) ]
    }
    
    func getSymbol() -> String {
        switch suit {
        case .clubs:
            return "♣"
        case .diamonds:
            return "♦"
        case .hearts:
            return "♥"
        default:
            return "♠"
        }
    }
    
    func getLabel() -> String {
        switch value {
        case 1:
            return "A"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return "K"
        default:
            return "\(self.value)"
        }
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return (lhs.value == rhs.value && lhs.suit == rhs.suit)
    }
}

enum CardSuit {
    case clubs, diamonds, hearts, spades
}
