//
//  CardCollection.swift
//  SlideNumber
//
//  Created by Mac-Peerapat on 17/11/2566 BE.
//

import Foundation

struct CardCollection<CardContent> where CardContent: Equatable {
    var card_conz:CardContent = "0" as! CardContent
    private(set) var cards: [Card]
    
    init(numOfCard: Int, contentFactory: (Int) -> CardContent) {
        cards = []
        for index in 0..<numOfCard{
            cards.append(Card(id: "\(index+1)", content: contentFactory(index)))
        }
    }
    
    mutating func swap(_ card: Card) {
        let index = index(of: card)
        let row = index / 4
        let column = index % 4
        if row > 0 && cards[index - 4].content == card_conz { // Check above
            cards.swapAt(index - 4, index)
        } else if row < 3 && cards[index + 4].content == card_conz { // Check below
            cards.swapAt(index + 4, index)
        } else if column > 0 && cards[index - 1].content == card_conz { // Check left
            cards.swapAt(index - 1, index)
        } else if column < 3 && cards[index + 1].content == card_conz { // Check right
            cards.swapAt(index + 1, index)
        }
    }
    
    func index(of card: Card) -> Int {
        for index in cards.indices{
            if cards[index] == card{
                return index
            }
        }
        return 0
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    
    struct Card: Equatable, Identifiable {
        var id: String
        var content: CardContent
    }
}
