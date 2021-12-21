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
    var answers: [Answer] = []
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        getResult()
    }
    
    //MARK: - Private Methods
    private func getResult() {
        //нужно ли этот метод закидывать в модель?
        
        var answersCounts: [AnimalType: Int] = [
            AnimalType.dog : 0,
            AnimalType.cat : 0,
            AnimalType.rabbit : 0,
            AnimalType.turtle : 0
        ]
        
        for answer in answers {
            answersCounts[answer.type]! += 1
        }
        
        let sortedAnswersCounts = answersCounts.sorted { $0.1 > $1.1 }
        
        let resultType = sortedAnswersCounts.first?.key
        let typeCharacter = resultType?.rawValue
        
        titleLabel.text = "Вы - \(typeCharacter!)!"
        descriptionLabel.text = resultType?.definition

    }
    

}
