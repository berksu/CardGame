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
        }.padding(.horizontal)
    }
    
    var title: some View{
        Text(viewModel.chosenTheme.name)
            .font(.largeTitle)
            .fontWeight(.bold)

    }
    
    var newGameButton: some View{
        Button {
            viewModel.newGame()
        } label: {
            Text("New Game")
        }

    }
    
    var content: some View{
        GeometryReader{ geometry in
            VStack{
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                        ForEach(viewModel.cards){ card in
                            Card(card: card, gradient: viewModel.chosenTheme.gradient)
                                .aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture {
                                    viewModel.choose(card)
                                }
                        }
                    }
                }
                Spacer()
                HStack{
                    newGameButton.foregroundColor(.blue)
                    Spacer()
                    Text("Score : \(viewModel.score)")
                }
            }
        }
        .foregroundColor(viewModel.cardColor())
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
}


struct Card: View{
    var card: MemoryGame<String>.Card
    var gradient: Gradient?
    
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
                // Extra credit 3
                if let gradient = gradient {
                    shape.fill(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
                }else{
                    shape.fill()
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
