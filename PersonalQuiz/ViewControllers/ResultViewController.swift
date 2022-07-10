//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit
import Foundation

class ResultViewController: UIViewController {
    
    // 1. Передать массив с ответами на экран с результатами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соответствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionResultLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        resultLabel.text = "ВЫ - \(definitionAnimal()?.rawValue ?? "🙁")"
        descriptionResultLabel.text = definitionAnimal()?.definition ?? "Тест не пройден"
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
}

extension ResultViewController {
    private func definitionAnimal() -> Animal? {
        var chosenAnimals:[Animal] = []
        
        for answerChosen in answersChosen {
            chosenAnimals.append(answerChosen.animal)
        }
        
        let mappedCount = chosenAnimals.map { ($0, 1) }
        let countsChosenAnimal = Dictionary(mappedCount, uniquingKeysWith: +)
        let definitionAnimal = countsChosenAnimal.sorted { $0.value > $1.value }
        
        return definitionAnimal.first?.key
    }
}
