//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Tiago Chaves on 24/01/23.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["😀", "😄", "😉", "😂", "😍", "😎", "🥸", "🥳"]
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
