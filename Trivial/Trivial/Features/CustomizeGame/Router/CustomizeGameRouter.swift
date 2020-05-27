//
//  CustomizeGameRouter.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class CustomizeGameRouter {
    
   class func configureComponents(presenter: CustomizeGamePresenter) {
        
        presenter.router = CustomizeGameRouter()
        presenter.interactor = CustomizeGameInteractor()
        presenter.interactor?.presenter = presenter
    }
    
    func navigateToQuestionsView(playerName: String, maxQuestions: String, results: [TrivialResults], classRef: UIViewController) {
        
        let vc = QuestionsViewController(nibName: "QuestionsViewController", bundle: nil)
        guard let sourceNavigationController = classRef.navigationController else { return }
        vc.questionsModel = QuestionsModel(playerName: playerName, maxQuestions: maxQuestions, questions: results)
        sourceNavigationController.pushViewController(vc, animated: true)
    }
}

extension CustomizeGameRouter: CustomizeGameRouterProtocol {
    
    func goToQuestions(playerName: String, maxQuestions: String, results: [TrivialResults], fromController: CustomizeGameViewController) {
        
        navigateToQuestionsView(playerName: playerName, maxQuestions: maxQuestions, results: results, classRef: fromController)
    }
}
