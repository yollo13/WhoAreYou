//
//  QuestionsViewController.swift
//  WhoAreYou
//
//  Created by YolloArts on 02.09.2020.
//  Copyright © 2020 YolloArts. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var rangedStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var questionProgressView: UIProgressView!
    
    //MARK: - Private Properties
    
    private let questions = Question.getQuestion()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func singleButonAnswerPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else {
            return
        }
        let currentAnswer = currentAnswers[currentIndex]
        answersChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed(_ sender: UIButton) {
        let index = Int(rangedSlider.value)
        answersChoosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? ResultsViewController else { return }
        dvc.resultChoosen = answersChoosen
    }
    
    
}

//MARK: - Private Methods
extension QuestionsViewController {
    /// Скрывает элементы экрана
    ///
    ///В цикле перебираются все StackView и для каждого выставляется параметр isHidden
    private func updateUI(){
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        // объявляем свойство, которому присваиваем элемент массива questions
        let currentQuestion = questions[questionIndex]
        //вывод на экран вопроса опросника в соответствии со значением свойства currentQuestion
        questionLabel.text = currentQuestion.text
        //объявляем свойство, которое показывает прогресс проходения опроса
        let totalProgress = Float(questionIndex) / Float(questions.count)
        //визуализация с помощью ProgressView процесса прохождения
        questionProgressView.setProgress(totalProgress, animated: true)
        //вывод вопроса в титул вью
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        //вызов метода для отображения стэков
        showCurrentAnswers(for: currentQuestion.type)
    }
    
    /// Отображение стэков ответов на текущий вопрос
    ///
    /// - Parameter type:
    ///
    ///
    private func showCurrentAnswers(for type: ResponceType) {
        switch type{
        case .single: showSingleAnswers(with: currentAnswers)
        case .multiple: showMultipleAnswers(with: currentAnswers)
        case .ranged: showRangedAnswers(with: currentAnswers)
        }
    }
    
    private func showSingleAnswers(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons,answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleAnswers(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangedAnswers(with answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
}
