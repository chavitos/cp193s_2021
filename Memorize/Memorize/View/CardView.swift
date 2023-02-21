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
                Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: -340))
                    .padding(DrawingConstants.circlePadding)
                    .opacity(DrawingConstants.circleOpacity)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: card.isMatched)
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.6
        static let fontSize: CGFloat = 32
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
        
        VStack {
            HStack {
                CardView(card: card1)
                CardView(card: card2)
            }
            HStack {
                CardView(card: card3)
                CardView(card: card4)
            }
        }
        .padding(10)
        .previewDevice("iPhone SE (3rd generation)")
    }
}
