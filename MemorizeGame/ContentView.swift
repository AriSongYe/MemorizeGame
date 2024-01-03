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
            HStack {
                ForEach(0..<cardNum, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
        HStack {
            Button("Remove Card") {
                cardNum -= 1
            }
            Spacer()
            Button("Add Card") {
                if (cardNum < emojis.count) {
                    cardNum += 1
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    @State private var isFaceUp : Bool = false
    var content : String
    var body: some View {
        ZStack(alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base
                    .fill(.white)
                base
                    .strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
