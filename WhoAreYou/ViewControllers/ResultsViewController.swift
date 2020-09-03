//
//  ResultsViewController.swift
//  WhoAreYou
//
//  Created by YolloArts on 02.09.2020.
//  Copyright © 2020 YolloArts. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var resultTitleLabel: UILabel!
    @IBOutlet var resultTextLabel: UILabel!
    
    //MARK: - Properties
    var resultChoosen: [Answer] = []
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        amountOfAnimals(animals: resultChoosen)
    }
    
    //MARK: - Private Methods
    private func amountOfAnimals(animals: [Answer]) {
        var dog = 0
        var cat = 0
        var rabbit = 0
        var monkey = 0
        
        for type in animals {
            switch type.type {
            case .dog:
                dog += 1
            case .cat:
                cat += 1
            case .rabbit:
                rabbit += 1
            case .monkey:
                monkey += 1
            }
        }
        
        let numbersOfAnimals = [
            AnimalType.dog : dog,
            AnimalType.cat : cat,
            AnimalType.rabbit : rabbit,
            AnimalType.monkey : monkey
        ]
        
        witchAnimalsAreMore(resultAnimal: numbersOfAnimals)
    }
    
    private func witchAnimalsAreMore(resultAnimal: [AnimalType : Int]) {
        var index = 0
        var currentAnimal = AnimalType.dog
        
        for (animal, amount) in resultAnimal {
            if amount > index {
                index = amount
                currentAnimal = animal
            }
        }
        resultTextLabel.text = currentAnimal.definition
        resultTitleLabel.text = "Вы - \(currentAnimal.rawValue)"
    }
}


