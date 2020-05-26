//
//  StartViewRouter.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class StartViewRouter {
    
   class func configureComponents(presenter: StartViewPresenter) {
        
        presenter.router = StartViewRouter()
        presenter.interactor = StartViewInteractor()
        presenter.interactor?.presenter = presenter
    }
    
    func navigateToCustomiceGame(classRef: UIViewController) {
        
        let vc = CustomizeGameViewController(nibName: "CustomizeGameViewController", bundle: nil)
        guard let sourceNavigationController = classRef.navigationController else { return }
        sourceNavigationController.pushViewController(vc, animated: true)
    }
}

extension StartViewRouter: StartViewRouterProtocol {
    
    func goToCustomizeGame(fromController: StartViewController) {
        
        navigateToCustomiceGame(classRef: fromController)
    }
}
