//
//  Card.swift
//  Concenration
//
//  Created by Анастасия on 05.02.2021.
//  Copyright © 2021 Nasty. All rights reserved.
//

import Foundation

struct Card {
    
   var isFaceUp = false //лицевой стороной вверх - нет
   var isMathed = false //совпавшая - нет
    var identifier: Int // идентификатор типа инт
    
    static var identifierNumber = 0 //статическая перем-ая
    
    static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber //статическая ф-ция, где мы будем генерировать номер идентификатора
    }
        init () {
            self.identifier = Card.identifierGenerator() //инициализатор, внутри будет инициализироваться наш идентификатор 
        }
    }
    
    
    
    





