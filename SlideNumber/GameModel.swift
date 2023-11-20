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
    var moveCount = 0
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
//        index = card.content
//        if let index = cards.firstIndex(where: { $0.id == card.id }) {
//            let row = index / 4
//            let column = index % 4
//            model.swap(card)
//            // Check if the selected tile can be moved and swap it with the empty space
//            if row > 0 && self.numbers[index - 4] == "0" { // Check above
//                self.numbers.swapAt(index - 4, index)
//                moveCount += 1
//            } else if row < 3 && self.numbers[index + 4] == "0" { // Check below
//                self.numbers.swapAt(index + 4, index)
//                moveCount += 1
//            } else if column > 0 && self.numbers[index - 1] == "0" { // Check left
//                self.numbers.swapAt(index - 1, index)
//                moveCount += 1
//            } else if column < 3 && self.numbers[index + 1] == "0" { // Check right
//                self.numbers.swapAt(index + 1, index)
//                moveCount += 1
//            }
        moveCount += 1
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
