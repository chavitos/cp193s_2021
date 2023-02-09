//
//  CardView.swift
//  Memorize
//
//  Created by Tiago Chaves on 30/12/22.
//

import SwiftUI

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: -340))
                        .padding(DrawingConstants.circlePadding)
                        .opacity(DrawingConstants.circleOpacity)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.6
        static let circlePadding: CGFloat = 5
        static let circleOpacity: Double = 0.5
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card1 = MemoryGame<String>.Card(isMatched: false, content: "👤", id: 1)
        let card2 = MemoryGame<String>.Card(isFaceUp: true, content: "👤", id: 2)
        let card3 = MemoryGame<String>.Card(content: "👤", id: 3)
        let card4 = MemoryGame<String>.Card(content: "👤", id: 4)
        
        HStack {
            CardView(card: card1)
            CardView(card: card2)
            CardView(card: card3)
            CardView(card: card4)
        }
        .padding(10)
        .previewDevice("iPhone SE (3rd generation)")
    }
}
