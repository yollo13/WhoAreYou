//
//  Question.swift
//  WhoAreYou
//
//  Created by YolloArts on 30.08.2020.
//  Copyright © 2020 YolloArts. All rights reserved.
//

enum ResponceType {
    case single //ответы на вопрос
    case multiple //множественный ответ через swipe
    case ranged //ответ через слайдер
}

struct Question {
    let text: String
    let type: ResponceType
    let answers: [Answer]
}

extension Question {
    static func getQuestion() -> [Question] {
        return [
            Question(text: "Что вы любите кушать?",
                     type: .single,
                     answers: [
                        Answer(text: "Стейк", type: .dog),
                        Answer(text: "Рыба", type: .cat),
                        Answer(text: "Морковка", type: .rabbit),
                        Answer(text: "Банан", type: .monkey)
            ]),
            Question(text: "Что вы любите делать больше всего?",
                     type: .multiple,
                     answers: [
                        Answer(text: "Лаять", type: .dog),
                        Answer(text: "Спать", type: .cat),
                        Answer(text: "Прыгать", type: .rabbit),
                        Answer(text: "Лазать", type: .monkey)
            ]),
            Question(text: "Любите кататься на авто?",
                     type: .ranged,
                     answers: [
                        Answer(text: "Ненавижу", type: .cat),
                        Answer(text: "Нервничаю", type: .rabbit),
                        Answer(text: "Норм", type: .dog),
                        Answer(text: "Обожаю", type: .monkey)
            ]),
        ]
    }
}
