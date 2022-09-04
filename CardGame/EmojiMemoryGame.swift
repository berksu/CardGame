//
//  EmojiMemoryGame.swift
//  CardGame
//
//  Created by Berksu Kısmet on 24.08.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    static let emojis = ["🐶","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🐮","🐸","🐵","🐔","🐧","🐦","🐤","🦆","🐥","🦉","🐴"]
    
    static let createGame = MemoryGame(numberOfCards: 4) { pairIndex in
        emojis[pairIndex]
    }
    
    @Published private var model: MemoryGame<String> = createGame
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    // MARK: User Intent
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func newGame(){
        
    }
}
