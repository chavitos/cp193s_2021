//
//  MemoryGame.swift
//  Memorize
//
//  Created by Tiago Chaves on 24/01/23.
//

import Foundation
  
struct MemoryGame<CardContent: Equatable> {
    private(set) var theme: Theme<CardContent>
    private(set) var cards: [Card] = []
    private(set) var score: Int = 0
    private var indexOfFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }
        }
    }
    
    mutating func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
              !cards[chosenIndex].isFaceUp,
              !cards[chosenIndex].isMatch else { return }
        
        if let potentialMatchIndex = indexOfFaceUpCard {
            if card.content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatch = true
                cards[potentialMatchIndex].isMatch = true
                
                score += 2
            } else {
                if cards[potentialMatchIndex].alreadySeen {
                    score -= 1
                }
                
                if cards[chosenIndex].alreadySeen {
                    score -= 1
                }
                
                cards[potentialMatchIndex].alreadySeen = true
                cards[chosenIndex].alreadySeen = true
            }
            
            cards[chosenIndex].isFaceUp = true
        } else {
            indexOfFaceUpCard = chosenIndex
        }
    }
    
    init(theme: Theme<CardContent>) {
        self.theme = theme
        for pairIndex in 0..<theme.cardsToShow {
            let content = theme.content[pairIndex]
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatch = false
        let content: CardContent
        var alreadySeen = false
        var id: Int
    }
}
 
