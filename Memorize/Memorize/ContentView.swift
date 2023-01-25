//
//  ContentView.swift
//  Memorize
//
//  Created by Tiago Chaves on 30/12/22.
//

import SwiftUI

struct ContentView: View {
    static let themes: [String: [String]] = [
        "vehicles": ["✈️", "🚐", "🚀" , "🛴", "🚚", "🛩", "🚂", "🛰", "🛸", "🛶"],
        "sports": ["🏉", "🎱", "🏓", "🪀", "🏸", "⚽️", "🏀", "🎾"],
        "smiles": ["😀", "😄", "😉", "😂", "😍", "😎", "🥸", "🥳"]
    ]
    
    @State var emojis = themes["vehicles"] ?? [] {
        didSet {
            emojisCount = Int.random(in: 4...emojis.count)
        }
    }
    
    @State var emojisCount: Int = 4
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(emojis[0..<emojisCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
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
            emojis = (ContentView.themes["vehicles"] ?? []).shuffled()
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
            emojis = (ContentView.themes["sports"] ?? []).shuffled()
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
            emojis = (ContentView.themes["smiles"] ?? []).shuffled()
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
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
