//
//  Themes.swift
//  CardGame
//
//  Created by Berksu Kısmet on 4.09.2022.
//

import Foundation

struct Themes{
    let allThemes = [Theme(name: "animals", emojis: ["🐶","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🐮","🐸","🐵","🐔","🐧","🐦","🐤","🦆","🐥","🦉","🐴"], color: "blue", numberOfShown: 16),
                     Theme(name: "vegetables", emojis: ["🥦", "🍅", "🌶", "🌽", "🥕", "🥬", "🥒", "🧄", "🍆", "🧅"], color: "red", numberOfShown: 10),
                     Theme(name: "catEmojis", emojis: ["😺", "😸", "😹", "😻", "🙀", "😿", "😾", "😼"], color: "yellow", numberOfShown: 8),
                     Theme(name: "vehicle", emojis: ["🚗", "🛴", "✈️", "🛵", "⛵️", "🚎", "🚐", "🚛", "🛻", "🏎", "🚂", "🚊", "🚀", "🚁", "🚢", "🛶", "🛥", "🚞", "🚟", "🚃"], color: "green", numberOfShown: 20),
                     Theme(name: "food", emojis: ["🍔", "🥐", "🍕", "🥗", "🥟", "🍣", "🍪", "🍚", "🍝", "🥙", "🍭", "🍤", "🥞", "🍦", "🍛", "🍗"], color: "black", numberOfShown: 16),
                     Theme(name: "weather", emojis: ["☀️", "🌪", "☁️", "☔️", "❄️"], color: "purple", numberOfShown: 5)
    ]
    
    struct Theme{
        let name: String
        let emojis: [String]
        let color: String
        var numberOfShown: Int
    }
}
