//
//  Answer.swift
//  WhoAreYou
//
//  Created by YolloArts on 30.08.2020.
//  Copyright © 2020 YolloArts. All rights reserved.
//

struct Answer {
    let text: String
    let type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐇"
    case monkey = "🙉"
    
    var definition: String {
        switch self { //определяем модель AnimalType по факту добавляем текст
        case .dog:
            return "Вам нравиться быть собакой. Лаете и лаете"
        case .cat:
            return "Вы кошка и точка"
        case .rabbit:
            return "Вы всего боитесь"
        case .monkey:
            return "Вы везеде лазаете"
        }
    }
}


