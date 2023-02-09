//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Tiago Chaves on 30/12/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack{
            HStack {
                Text("Score: \(game.score)")
                Spacer()
                Text(game.themeName).font(.title2)
                Spacer()
                Button("New game") {
                    withAnimation(.easeInOut) {
                        game.newGame()
                    }
                }
            }
            .padding()
            Divider()
            AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
            .foregroundColor(game.themeColor)
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .previewDevice("iPhone SE (3rd generation)")
    }
}
