//
//  ContentView.swift
//  SlideNumber
//
//  Created by Mac-Peerapat on 6/11/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameModel : GameModel
    let gridSize:Int = 16
    var body: some View {
        VStack() {
            Spacer()
            Text("Number Slide Puzzle")
                .font(.largeTitle)
                .bold()
            Spacer()
            cards
                .foregroundColor(.orange)
            Spacer()
            Text(gameModel.hasWon ? "You Won!!!" : "")
                .foregroundColor(.red)
                .font(.largeTitle).bold()
            Spacer()
            HStack(){
                Text("Moves: \(gameModel.moveCount)")
                    .foregroundColor(.blue)
                    .font(.title).bold()
                Spacer()
                Button("New Game"){
                    gameModel.newGame()
                }
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .background(.green)
                .cornerRadius(12)
            }
            .padding()
        }
        .padding()
    }

    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10){
            createCards()
        }
    }
    
    func createCards() -> some View{
        ForEach(0..<16){ index in
            CardView(number: gameModel.getNumber(num: index))
                .aspectRatio(1, contentMode: .fit)
                .onTapGesture {
                    gameModel.moveNumber(at: index)
                }
            
        }
    }
}

struct CardView: View{
    let number: Int
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if number != 0{
                Group {
                    base.foregroundColor(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text("\(number)").font(.largeTitle)
                        .bold()
            }
        }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameModel: GameModel())
    }
}
