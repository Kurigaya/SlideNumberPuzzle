//
//  GameModel.swift
//  SlideNumber
//
//  Created by Mac-Peerapat on 6/11/2566 BE.
//

import SwiftUI

class GameModel : ObservableObject {
    var gridSize = 4
    var hasWon = false
    public var moveCount = 0
    static var all_numbers = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"] + ["0"]
    var numbers: [String] = []
    @Published private var model: CardCollection<String> = createModel()
    var cards: [CardCollection<String>.Card] {return model.cards}
    
    static func createModel() -> CardCollection<String>{
        let numbers = all_numbers.shuffled()
        var model = CardCollection<String>(numOfCard: 16, contentFactory: {(index) in numbers[index]})
        model.shuffle()
        return model
    }
    
    func moveNumber(_ card: CardCollection<String>.Card) {
        model.swap(card)
        moveCount = model.getMoveCount()
        checkWin()
        
    }

    func checkWin(){
        hasWon = self.numbers == ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"] + ["0"]
    }
    
    func newGame(){
        model = GameModel.createModel()
        hasWon = false
        moveCount = 0
    }

    
}
