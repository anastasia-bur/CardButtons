//
//  ConcentrationGame.swift
//  Concenration
//
//  Created by Анастасия on 05.02.2021.
//  Copyright © 2021 Nasty. All rights reserved.
//

import Foundation

class ConcentrationGame {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int? //индекс одной единственной перевернутой лицом вверх карточки
    func chooseCard(at index: Int) { //ф-ция кот-ая прописывает алгоритм игры
        
        if !cards[index].isMathed { //проверка
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index { //если мы можем присвоить значение мэтчинг индекс, то значит у нас есть одна единств переверн карточка
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMathed = true
                    cards [index].isMathed = true //мы меняем их состояния и говорим что карточки явл совпавшими
                    
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil //
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false  //все карточки в масссиве лицом вверх явл неправдой
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index //одну единств карточку нужно перевернуть вверх
                }
          }
        
    }
    
    init (numberOfPairsOfCards: Int) { //инициализатор с параметром кол-во парных карточек
        for _ in 1...numberOfPairsOfCards {
            let card = Card() //при каждом цикле мы будем создавать новую карточку путем экземпляра структур
            
            cards.append(card)
            cards.append(card)
            
        }
        cards.shuffle()
    }
}

extension Array {
    mutating func shuffle() {
        if count < 2 { return }
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            self.swapAt(i, j)
        }
    }
}
