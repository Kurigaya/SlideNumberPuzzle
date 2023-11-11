//
//  GameModel.swift
//  SlideNumber
//
//  Created by Mac-Peerapat on 6/11/2566 BE.
//

import SwiftUI
import Foundation
import CoreGraphics

class GameModel : ObservableObject {
    @Published var gridSize = 4
//    @Published var numbers = Array(1...15) + [0]
    @Published var hasWon = false
    @Published var moveCount = 0
    @Published private var numbers: [Int]
    
//    @Published private var model = initGame()
//    @Published private var cards = [[1,2,3,4],
//                                    [5,6,7,8],
//                                    [9,10,11,12],
//                                    [13,14,15,empty]]
    init(){
        self.gridSize = 4
        self.numbers = []
        initGame()
    }
    
    func initGame(){
        numbers = Array(1...15) + [0]
        numbers.shuffle()
    }
    
    func moveNumber(at index: Int) {
        let row = index / 4
        let column = index % 4
        
        withAnimation(Animation.easeInOut(duration: 0.5)) { // Adjust the duration as needed
            // Check if the selected tile can be moved and swap it with the empty space
            if let above = row > 0 ? index - 4 : nil, numbers[above] == 0 {
                numbers.swapAt(above, index)
                moveCount += 1
            } else if let below = row < 3 ? index + 4 : nil, numbers[below] == 0 {
                numbers.swapAt(below, index)
                moveCount += 1
            } else if let left = column > 0 ? index - 1 : nil, numbers[left] == 0 {
                numbers.swapAt(left, index)
                moveCount += 1
            } else if let right = column < 3 ? index + 1 : nil, numbers[right] == 0 {
                numbers.swapAt(right, index)
                moveCount += 1
            }
        }
    }
    
    func getNumber(num: Int) -> Int{
        return numbers[num]
    }
    
    func getNumbers() -> [Int]{
        return numbers
    }
    
    func checkWin(){
        hasWon = numbers == Array(1...15) + [0]
    }
    
    func newGame(){
        initGame()
        hasWon = false
        moveCount = 0
    }

    
}
