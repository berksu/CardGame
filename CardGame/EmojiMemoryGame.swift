//
//  EmojiMemoryGame.swift
//  CardGame
//
//  Created by Berksu Kısmet on 24.08.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{

    static func createGame(theme: Themes.Theme) -> MemoryGame<String>{
        var numOfShown = theme.numberOfShown
        // Extra credit 2
        if theme.name == "animals" || theme.name == "food"{
            numOfShown = Int.random(in: 2..<theme.numberOfShown)
        }
        
        return MemoryGame(numberOfCards: numOfShown) { pairIndex in
            theme.emojis[pairIndex]
        }
    }

    private var themes: Themes = Themes()
    @Published private var model: MemoryGame<String>
    @Published private(set) var chosenTheme: Themes.Theme
    
    init(){
        chosenTheme = themes.allThemes[0]
        // Fix it
        model = EmojiMemoryGame.createGame(theme: themes.allThemes[0])
        chooseRandomTheme()
    }
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    var score: Int{
        model.score
    }
    
     func chooseRandomTheme(){
        chosenTheme = themes.allThemes.randomElement()!
        model = EmojiMemoryGame.createGame(theme: chosenTheme)
        model.shuffleCards()
    }
    
    
    func cardColor() -> Color{
        switch chosenTheme.color{
        case "blue": return .blue
        case "red": return .red
        case "yellow": return .yellow
        case "green": return .green
        case "black": return .black
        case "purple": return .purple
        default: return .red
        }
    }
    
        
    // MARK: User Intent
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func newGame(){
        chooseRandomTheme()
    }
}
