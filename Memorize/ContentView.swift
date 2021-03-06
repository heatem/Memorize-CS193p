//
//  ContentView.swift
//  Memorize
//
//  Created by Heather Mason on 6/27/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["ð", "ð", "ðĩ", "âĩïļ", "ð", "ð", "ð", "ð", "ð", "ðŧ", "ð", "ð", "ðē", "ðĶž", "ðš", "ðĄ", "ð", "ð", "ðķ", "ðļ", "ðđ", "ðž", "ð", "ð"]
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
            emojis = ["ð", "ð", "ðĩ", "âĩïļ", "ð", "ð", "ð", "ð", "ð", "ðŧ", "ð", "ð", "ðē", "ðĶž", "ðš", "ðĄ", "ð", "ð", "ðķ", "ðļ", "ðđ", "ðž", "ð", "ð"].shuffled()
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
            emojis = ["ðē", "ðģ", "ðī", "ðŧ", "ðŠĻ", "ð", "ðļ", "âĄïļ", "âïļ", "âïļ", "ðŠķ", "ðĩ"].shuffled()
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
            emojis = ["ð·", "ðĩïļââïļ", "ð§ââïļ", "ð§âð", "ð§ââïļ", "ðĻâð", "ðĻâðŦ", "ðĐâð­", "ð§âðŧ", "ð§âðĪ", "ð§âð§", "ðĻâðĻ", "ðĐâðŽ"].shuffled()
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
