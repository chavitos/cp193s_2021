//
//  ContentView.swift
//  Memorize
//
//  Created by Tiago Chaves on 30/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var emojiCount = 2
    var emojis = ["✈️", "🚐", "🚀" , "🛴", "🚚",
                  "🛩", "🚂", "🛰", "🛸", "🛶"]
    
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var add: some View {
        Button {
            emojiCount = emojiCount < emojis.count ? emojiCount + 1 : emojiCount
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var remove: some View {
        Button {
            emojiCount = emojiCount > 1 ? emojiCount - 1 : emojiCount
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
