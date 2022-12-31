//
//  CardView.swift
//  Memorize
//
//  Created by Tiago Chaves on 30/12/22.
//

import SwiftUI

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CardView(content: "👤")
            CardView(content: "👤")
            CardView(content: "👤")
            CardView(content: "👤")
        }
        .previewDevice("iPhone SE (3rd generation)")
    }
}
