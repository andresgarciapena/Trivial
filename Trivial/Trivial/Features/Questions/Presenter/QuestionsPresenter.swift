//
//  QuestionsPresenter.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class QuestionsPresenter: QuestionsProtocol {

    var viewRef: QuestionsViewController?
    var router: QuestionsRouter?
    var interactor: QuestionsInteractor?

    var questionsModel: QuestionsModel?
    
    func viewDidLoad() {
        
        QuestionsRouter.configureComponents(presenter: self)
    }
    
    func viewWillAppear(animated: Bool, navigationItem: UINavigationItem) {
        
        navigationItem.title = questionsModel?.playerName
    }
    
    func saveData(questionsModel: QuestionsModel?) {
        
        self.questionsModel = questionsModel
    }
    
    func getNextQuestion() -> Question? {
        
        let index = questionsModel?.index ?? 0
        if index == questionsModel?.questionList.count {
            return nil
        } else {
            return questionsModel?.questionList[index]
        }
    }
    
    func validateQuestion(question: Question, indexPath: IndexPath) -> Bool? {
        
        let correctAnswer = question.correct
        return correctAnswer == question.answers[indexPath.item] ? true : false
    }
    
    func updateQuestionAndPlayerScore(numQuestion: Int, score: Int) {
        
        questionsModel?.index += numQuestion
        questionsModel?.playerScore += score
    }
    
    func getScore() -> Int {
        guard let playerScore = questionsModel?.playerScore else { return 0 }
        return playerScore
    }
    
    func getQuestionCount() -> Int {
        return questionsModel!.index + 1
    }
    
    func getMaxQuestions() -> String {
        return questionsModel!.numQuestions
    }
    
    func saveUserScore() {
        guard let playerName = questionsModel?.playerName, let numberOfQuestions = questionsModel?.numQuestions, let numberOfCorrectQuestions = questionsModel?.playerScore else { return }
        interactor?.uploadUserScore(playerName: playerName, numberOfQuestions: numberOfQuestions, numberOfCorrectQuestions: String(numberOfCorrectQuestions))
    }
    
    func showPlayerScore() {
        let result = getScore()
        viewRef?.showResultPopup(result: String(result))
    }
    
    func startNewGame() {
        
        guard let sourceController = viewRef else { return }
        router?.goToNewGame(fromController: sourceController)
    }
}
