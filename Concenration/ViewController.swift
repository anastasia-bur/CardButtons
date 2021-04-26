//
//  ViewController.swift
//  Concenration
//
//  Created by Анастасия on 05.02.2021.
//  Copyright © 2021 Nasty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   lazy var game = ConcentrationGame(numberOfPairsOfCards: (buttonCollection.count + 1) / 2) //создали экземпляр класса. заполнили параметр кол-вом парных карточек
 var touches = 0 { //переменная, к-ая изначально равна 0
            didSet { // наблюдатель,к-ый дает команду обновиться тексту
            touchLabel.text = "Touches: \(touches)" // обновление текста
            
        }
    }
    var emojiCollection = ["🐙","🐳","🐠","🐋","🦈","🦑","🦞","🦐","🦀","🐡"] // создали коллекцию емодзи
    
    var emojiDictionary = [Int:String]() //в квадратных скобках указан тип ключа, в к-ом мы будем искать наше значение. в качестве ключа мы можем использовать идентификатор карточек. после : указа тип значения, к-ое мы будем искать
    
    func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            emojiDictionary [card.identifier] = emojiCollection.remove(at: emojiCollection.count.acr4randomExtension)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    
    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMathed ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.199295342, green: 0.8115466237, blue: 0.3556014299, alpha: 1) // создали ф-цию, которая принимает 2 параметра : эмодзи и кнопку и прописали логику переворачивания карточки
                // когда на кнопке есть эмодзи, то его нужно убрать, то есть стереть текст из заголовка и фон этой кнопки сделать зеленым, но если фон кнопки зеленого цвета и нет эмодзи, а мы нажимаем на кнопку, то мы фон этой кнопки меняем на белый цвет и в заголовке вставляем эмодзи
            }
        }
        
        
        
    }
    
    
    
    

    
    @IBOutlet var buttonCollection: [UIButton]! //приконектили коллекцию кнопок карточек
    @IBOutlet weak var touchLabel: UILabel! //приконектили ярлык, отвечающий за кол-во нажатий
    @IBAction func buttonAction(_ sender: UIButton) { // приконектили кнопки карточек
         touches += 1 // при нажатии значение будет увеличиваться на 1
   let transformAnim  = CAKeyframeAnimation(keyPath:"transform")
   transformAnim.values  = [NSValue(caTransform3D: CATransform3DMakeRotation(0.04, 0.0, 0.0, 1.0)),NSValue(caTransform3D: CATransform3DMakeRotation(-0.04 , 0, 0, 1))]
   transformAnim.autoreverses = true
   transformAnim.duration  = 0.125
   transformAnim.repeatCount = Float.infinity
        sender.layer.add(transformAnim, forKey: "shake")
        if let buttonIndex = buttonCollection.firstIndex(of: sender) { // индексы кнопок в колекции/прописана логика переворачивания карточек/вызвали оператор if и если мы можем присвоить все индексы, то мы все выполним, если чего-го нет, то нет
          game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
        
    }

}

extension Int {
    var acr4randomExtension : Int {
        return Int(arc4random_uniform(UInt32(self)))
    }

}

