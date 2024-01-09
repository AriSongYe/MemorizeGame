//
//  ContentView.swift
//  MemorizeGame
//
//  Created by  송에 on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    let emojis : [String] = ["👻","🕷️","🎃","👿", "😎", "💙", "😻", "🤓", "🩶", "🐝", "☔️", "🍖"]
    @State private var cardNum : Int = 5
    
    var body: some View {
        VStack {
            ScrollView(content: {
                cards
            })
            cardCountAdjusters
        }
    }
    
    var cardCountAdjusters: some View {
        HStack {
            CardRemover
            Spacer()
            CardAdder
        }
        .padding()
    }
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardNum += offset
        }, label: { Image(systemName : symbol)})
            .imageScale(.large)
            .font(.largeTitle)
            .disabled(cardNum + offset < 1 || cardNum + offset > emojis.count)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardNum, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3 , contentMode: .fit)
            }
        }
        .foregroundColor(.orange)    }
    
    var CardRemover : some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var CardAdder : some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    @State private var isFaceUp : Bool = true
    var content : String
    var body: some View {
        ZStack(alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base
                    .fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            //.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
