//
//  QuestionsProtocol.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

protocol QuestionsProtocol {
    
    var viewRef: QuestionsViewController? {get set}
    var router: QuestionsRouter? {get set}
    var interactor: QuestionsInteractor? {get set}
    
    var questionsModel: QuestionsModel? {get set}
    
    func viewDidLoad()
    func viewWillAppear(animated: Bool, navigationItem: UINavigationItem)
    
    func saveData(questionsModel: QuestionsModel?)
    func getNextQuestion() -> Question?
    func validateQuestion(question: Question, indexPath: IndexPath) -> Bool?
    func updateQuestionAndPlayerScore(numQuestion: Int, score: Int)
    func getScore() -> Int
    func getQuestionCount() -> Int
}

protocol QuestionsInteractorProtocol {
    
    var presenter: QuestionsPresenter? {get set}
}
