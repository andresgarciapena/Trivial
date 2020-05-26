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
    
    func navigateToQuestionsView(results: [TrivialResults], classRef: UIViewController) {
        
        print(results)
    }
}

extension CustomizeGameRouter: CustomizeGameRouterProtocol {
    
    func goToQuestions(results: [TrivialResults], fromController: CustomizeGameViewController) {
        
        navigateToQuestionsView(results: results, classRef: fromController)
    }
}
