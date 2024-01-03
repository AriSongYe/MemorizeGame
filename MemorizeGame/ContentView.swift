//
//  ContentView.swift
//  MemorizeGame
//
//  Created by  송에 on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.orange)
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    var isFaceUp : Bool = false
    var body: some View {
        if isFaceUp {
            ZStack(content: {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            })
        } else {
            RoundedRectangle(cornerRadius: 12)
        }
    }
}
