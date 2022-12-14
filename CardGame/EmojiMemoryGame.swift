//
//  EmojiMemoryGame.swift
//  CardGame
//
//  Created by Berksu KÄ±smet on 24.08.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    static let emojis = ["ð¶","ð­","ð¹","ð°","ð¦","ð»","ð¼","ð¨","ð¯","ð®","ð¸","ðµ","ð","ð§","ð¦","ð¤","ð¦","ð¥","ð¦","ð´"]
    
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
    
    
    
    
    static let themes = ["animals" : ["ð¶","ð­","ð¹","ð°","ð¦","ð»","ð¼","ð¨","ð¯","ð®","ð¸","ðµ","ð","ð§","ð¦","ð¤","ð¦","ð¥","ð¦","ð´"],
                  "vegetables" : ["ð¥¦", "ð", "ð¶", "ð½", "ð¥", "ð¥¬", "ð¥", "ð§", "ð", "ð§"],
                  "emojis" : ["ðº", "ð¸", "ð¹", "ð»", "ð", "ð¿", "ð¾", "ð¼"]
    ]

}
