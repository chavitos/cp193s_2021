//
//  ContentView.swift
//  Memorize
//
//  Created by Tiago Chaves on 30/12/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
            HStack {
                Text("Score: \(viewModel.score)")
                Spacer()
                Text(viewModel.themeName).font(.title2)
                Spacer()
                Button("New game") {
                    withAnimation(.easeInOut) {
                        viewModel.newGame()
                    }
                }
            }
            .padding()
            Divider()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.themeColor)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .previewDevice("iPhone SE (3rd generation)")
    }
}
