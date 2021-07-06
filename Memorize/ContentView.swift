//
//  ContentView.swift
//  Memorize
//
//  Created by Heather Mason on 6/27/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚂", "🚗", "🛵", "⛵️", "🚀", "🚕", "🚌", "🚎", "🏎", "🛻", "🚛", "🚜", "🚲", "🦼", "🛺", "🚡", "🚃", "🚟", "🛶", "🛸", "🛹", "🛼", "🏄", "🚁"]
    @State var emojiCount = 12
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                transportation
                Spacer()
                nature
                Spacer()
                careers
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var transportation: some View {
        Button {
            emojis = ["🚂", "🚗", "🛵", "⛵️", "🚀", "🚕", "🚌", "🚎", "🏎", "🛻", "🚛", "🚜", "🚲", "🦼", "🛺", "🚡", "🚃", "🚟", "🛶", "🛸", "🛹", "🛼", "🏄", "🚁"].shuffled()
            emojiCount = emojis.count
        } label: {
            VStack {
                Image(systemName: "car").font(.title)
                Text("Transport").font(.body)
            }
        }
    }
    
    var nature: some View {
        Button {
            emojis = ["🌲", "🌳", "🌴", "🌻", "🪨", "🍄", "🌸", "⚡️", "☀️", "❄️", "🪶", "🌵"].shuffled()
            emojiCount = emojis.count
        } label: {
            VStack {
                Image(systemName: "leaf").font(.title)
                Text("Nature").font(.body)
            }
        }
    }
    
    var careers: some View {
        Button {
            emojis = ["👷", "🕵️‍♀️", "🧑‍✈️", "🧑‍🚀", "🧑‍⚕️", "👨‍🎓", "👨‍🏫", "👩‍🏭", "🧑‍💻", "🧑‍🎤", "🧑‍🔧", "👨‍🎨", "👩‍🔬"].shuffled()
            emojiCount = emojis.count
        } label: {
            VStack {
                Image(systemName: "person").font(.title)
                Text("Careers").font(.body)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
            shape.strokeBorder(lineWidth: 3.0)
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
