//
//  StartViewPresenter.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class StartViewPresenter: StartViewProtocol {
    
    var viewRef: StartViewController?
    var router: StartViewRouter?
    var interactor: StartViewInteractor?
    
    func viewDidLoad() {
        
        StartViewRouter.configureComponents(presenter: self)
    }
    
    func viewWillAppear(animated: Bool, navigationController: UINavigationController?) {
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func navigateToNextView() {
        
        guard let sourceController = viewRef else { return }
        router?.goToCustomizeGame(fromController: sourceController)
    }
    
    func navigateToClassificationView() {
        
        guard let sourceController = viewRef else { return }
        router?.goToClassification(fromController: sourceController)
    }
}
