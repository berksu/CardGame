//
//  ContentView.swift
//  CardGame
//
//  Created by Berksu Kısmet on 1.08.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = EmojiMemoryGame()
    
    var body: some View {
        VStack{
            title
            content
            Spacer()
//            HStack{
//                theme1
//                Spacer()
//                theme2
//                Spacer()
//                theme3
//            }.padding()
        }.padding(.horizontal)
    }
    
    var title: some View{
        Text("Memorize !")
            .font(.largeTitle)
            .fontWeight(.bold)

    }
    
    var content: some View{
        GeometryReader{ geometry in
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards){ card in
                        Card(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
        }
        .foregroundColor(.red)
    }
    
    
//    func calculateTheMinimumSize(cardCount: Int, size: CGSize) -> CGFloat{
//        var width = 0.0 , height = 0.0
//        for numOfElementInARow in 1..<cardCount{
//            width = (size.width / Double(numOfElementInARow)) - Double((numOfElementInARow - 1) * 5)
//            height = width * 3/2
//            let columnNum = ceil(Double(cardCount) / Double(numOfElementInARow))
//
//            print(numOfElementInARow)
//            print(columnNum)
//            print("height: \(height), width: \(width)")
//            print("geometry height: \(size.height), geometry width: \(size.width)")
//            print(height * columnNum + ((columnNum-1) * 20))
//            print("***************")
//
//            if(height * columnNum + ((columnNum-1) * 10) < size.height){
//                return width
//            }
//        }
//        return 65
//    }
    
//    var theme1: some View{
//        Button {
//            emojis = themes["animals"]!
//            count = Int.random(in: 4...emojis.count)
//            emojis.shuffle()
//        } label: {
//            VStack{
//                Image(systemName: "tortoise").font(.largeTitle)
//                Text("Animals")
//            }
//        }
//
//    }
//
//    var theme2: some View{
//        Button {
//            emojis = themes["vegetables"]!
//            count = Int.random(in: 4...emojis.count)
//            emojis.shuffle()
//        } label: {
//            VStack{
//                Image(systemName: "leaf").font(.largeTitle)
//                Text("Vegetables")
//            }
//        }
//
//    }
//
//    var theme3: some View{
//        Button {
//            emojis = themes["emojis"]!
//            count = Int.random(in: 4...emojis.count)
//            emojis.shuffle()
//        } label: {
//            VStack{
//                Image(systemName: "face.smiling").font(.largeTitle)
//                Text("Emojis")
//            }
//        }
//
//    }
}


struct Card: View{
    var card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 12)
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            }else if card.isMatched{
                shape.opacity(0)
            }
            else{
                shape.fill()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
