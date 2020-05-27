//
//  QuestionsRouter.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class QuestionsRouter {
    
   class func configureComponents(presenter: QuestionsPresenter) {
        
        presenter.router = QuestionsRouter()
        presenter.interactor = QuestionsInteractor()
        presenter.interactor?.presenter = presenter
    }
    
    func navigateToNewGame(classRef: UIViewController) {
        
        let vc = StartViewController(nibName: "StartViewController", bundle: nil)
        guard let sourceNavigationController = classRef.navigationController else { return }
        sourceNavigationController.pushViewController(vc, animated: true)
    }
}

extension QuestionsRouter: QuestionsRouterProtocol {
    
    func goToNewGame(fromController: QuestionsViewController) {
        
        navigateToNewGame(classRef: fromController)
    }
}
