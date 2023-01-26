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
    private var indexOfFaceUpCard: Int?
    
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
            
            indexOfFaceUpCard = nil
        } else {
            for index in cards.indices {
                cards[index].isFaceUp = false
            }
            indexOfFaceUpCard = chosenIndex
        }
        
        cards[chosenIndex].isFaceUp.toggle()
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
        var isFaceUp: Bool = false
        var isMatch: Bool = false
        var content: CardContent
        var alreadySeen: Bool = false
        var id: Int
    }
}
 
