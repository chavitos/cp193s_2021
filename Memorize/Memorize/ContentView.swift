//
//  ContentView.swift
//  Memorize
//
//  Created by Tiago Chaves on 30/12/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
//    static let themes: [String: [String]] = [
//        "vehicles": ["✈️", "🚐", "🚀" , "🛴", "🚚", "🛩", "🚂", "🛰", "🛸", "🛶"],
//        "sports": ["🏉", "🎱", "🏓", "🪀", "🏸", "⚽️", "🏀", "🎾"],
//        "smiles": ["😀", "😄", "😉", "😂", "😍", "😎", "🥸", "🥳"]
//    ]
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
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
            .foregroundColor(.red)
            
            HStack {
                veichles
                Spacer()
                sports
                Spacer()
                smiles
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var veichles: some View {
        Button {
//            emojis = (ContentView.themes["vehicles"] ?? []).shuffled()
        } label: {
            VStack {
                Image(systemName: "car.rear")
                Text("Vehicles")
                    .font(.footnote)
            }
        }
    }
    
    var sports: some View {
        Button {
//            emojis = (ContentView.themes["sports"] ?? []).shuffled()
        } label: {
            VStack {
                Image(systemName: "basketball.fill")
                Text("Sports")
                    .font(.footnote)
            }
        }
    }
    
    var smiles: some View {
        Button {
//            emojis = (ContentView.themes["smiles"] ?? []).shuffled()
        } label: {
            VStack {
                Image(systemName: "face.smiling.inverse")
                Text("Smiles")
                    .font(.footnote)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .previewDevice("iPhone SE (3rd generation)")
    }
}
