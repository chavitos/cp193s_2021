//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Tiago Chaves on 24/01/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["😀", "😄", "😉", "😂", "😍", "😎", "🥸", "🥳"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
