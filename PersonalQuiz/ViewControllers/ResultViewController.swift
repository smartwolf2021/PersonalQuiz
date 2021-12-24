//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Тагир Садыков on 21.12.2021.
//

import UIKit

class ResultViewController: UIViewController {

    //задание:
    //передать сюда массив ответов
    //определить наиболее часто встречающийся тип животного
    //отобразить результаты в соответствии с животным
    //избавиться от кнопки назад
    //MARK: - IB Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - Public Properties
    var answers: [Answer]!
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        getResult()
    }
    
    //MARK: - Private Methods
    fileprivate func updateUI(_ resultType: AnimalType?) {
        let typeCharacter = resultType?.rawValue
        
        titleLabel.text = "Вы - \(typeCharacter!)!"
        descriptionLabel.text = resultType?.definition
    }
    
    private func getResult() {
        //нужно ли этот метод закидывать в модель?
        
        var answersCounts: [AnimalType: Int] = [:]
        let animals = answers.map {$0.type}
        
//        for animal in animals {
//            if let animalTypeCount = answersCounts[animal] {
//                answersCounts.updateValue(animalTypeCount + 1, forKey: animal)
//            } else {
//                answersCounts[animal] = 1
//            }
//        }
        
        for animal in animals {
            answersCounts[animal] = (answersCounts[animal] ?? 0) + 1
        }
        
        //решение в одну строку
//        let mostFrequencyType = Dictionary(grouping: answers) {$0.type}.sorted {$0.value.count > $1.value.count}.first?.key
        
        let sortedAnswersCounts = answersCounts.sorted { $0.1 > $1.1 }
        
        let resultType = sortedAnswersCounts.first?.key
        updateUI(resultType)

    }
    

}
