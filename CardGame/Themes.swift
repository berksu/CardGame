//
//  Themes.swift
//  CardGame
//
//  Created by Berksu Kısmet on 4.09.2022.
//

import Foundation
import SwiftUI

struct Themes{
    let allThemes = [Theme(name: "animals", emojis: ["🐶","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🐮","🐸","🐵","🐔","🐧","🐦","🐤","🦆","🐥","🦉","🐴"], color: "blue", numberOfShown: 6),
                     Theme(name: "vegetables", emojis: ["🥦", "🍅", "🌶", "🌽", "🥕", "🥬", "🥒", "🧄", "🍆", "🧅"], color: "red", numberOfShown: 10),
                     Theme(name: "catEmojis", emojis: ["😺", "😸", "😹", "😻", "🙀", "😿", "😾", "😼"], color: "yellow", numberOfShown: 8),
                     Theme(name: "vehicle", emojis: ["🚗", "🛴", "✈️", "🛵", "⛵️", "🚎", "🚐", "🚛", "🛻", "🏎"], color: "green", numberOfShown: 20),
                     Theme(name: "food", emojis: ["🍔", "🥐", "🍕", "🥗", "🥟", "🍣", "🍪", "🍚", "🍝", "🥙", "🍭", "🍤", "🥞", "🍦", "🍛", "🍗"], color: "black", numberOfShown: 10),
                     Theme(name: "weather", emojis: ["☀️", "🌪", "☁️", "☔️", "❄️","❄️","❄️"], gradient: Gradient(colors: [Color.clear, Color.black]), numberOfShown: 7)
    ]
    
    struct Theme{
        let name: String
        let emojis: [String]
        let color: String
        var numberOfShown: Int
        var gradient: Gradient?
        
        init(name: String, emojis: [String], color: String, numberOfShown: Int){
            self.name = name
            self.emojis = Set(emojis).shuffled()
            self.color = color
            self.numberOfShown = numberOfShown < self.emojis.count ? numberOfShown : self.emojis.count
        }
        
        // Extra Credit 1
        init(name: String, emojis: [String], color: String){
            self.name = name
            self.emojis = Set(emojis).shuffled()
            self.color = color
            self.numberOfShown = self.emojis.count
        }
        
        // Extra Credit 3
        init(name: String, emojis: [String], gradient: Gradient, numberOfShown: Int){
            self.name = name
            self.emojis = Set(emojis).shuffled()
            self.numberOfShown = self.emojis.count
            self.gradient = gradient
            self.color = "red"
        }
    }
    
}
