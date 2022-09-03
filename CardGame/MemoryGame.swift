//
//  MemoryGame.swift
//  CardGame
//
//  Created by Berksu Kısmet on 24.08.2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    private(set) var cards: Array<Card>
    private var oneAndOnlyFaceUp: Int?
    
    mutating func choose(_ card: Card){
        if let chosenCard = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenCard].isMatched,
           !cards[chosenCard].isFaceUp{
            if let possibleMatch = oneAndOnlyFaceUp
            {
                if(cards[possibleMatch].content == cards[chosenCard].content){
                    cards[possibleMatch].isMatched = true
                    cards[chosenCard].isMatched = true
                }
                oneAndOnlyFaceUp = nil
            }else{
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                oneAndOnlyFaceUp = chosenCard
            }
            
            cards[chosenCard].isFaceUp.toggle()
        }
    }
    
    init(numberOfCards: Int, createContent: (Int) -> CardContent){
        cards = []
        for i in 0..<numberOfCards{
            let content = createContent(i)
            cards.append(Card(id: 2 * i, content: content))
            cards.append(Card(id: 2 * i + 1, content: content))

        }
    }
    
    struct Card: Identifiable{
        var id: Int
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
    
}
