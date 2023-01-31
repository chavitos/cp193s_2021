//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Tiago Chaves on 24/01/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojiThemes = [Theme(name: "Halloween", content: ["👻","🦇","🎃","🧙‍♀️"], color: .orange),
                                      Theme(name: "Sports", content: ["⚽️","🥎","🏈","🎱"], color: .blue),
                                      Theme(name: "Tecnology", content: ["⌚️","📱","💻","🖱"], color: .black),
                                      Theme(name: "Animals", content: ["🐶","🦁","🐯","🐷","🦊"], color: .green),
                                      Theme(name: "Flags", content: ["🇨🇦","🇨🇴","🇰🇷","🇺🇸","🇯🇵","🇧🇷"], color: .red),
                                      Theme(name: "Emojis", content: ["😀", "😄", "😉", "😂", "😍", "😎", "🥸", "🥳"], color: .yellow),
                                      Theme(name: "Symbols", content: ["☪️","🕉","☮️","💟","♎️","⚛️","✝️"], color: .purple, randomNumberOfCards: true)]
    
    static private func createMemoryGame() -> MemoryGame<String> {
        let theme = emojiThemes.randomValue
        return MemoryGame<String>(theme: theme!)
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    var themeName: String {
        model.theme.name
    }
    
    var themeColor: Color {
        model.theme.color
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
