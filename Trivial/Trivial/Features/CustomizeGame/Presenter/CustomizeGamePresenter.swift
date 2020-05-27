//
//  CustomizeGamePresenter.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class CustomizeGamePresenter: CustomizeGameProtocol {
    
    var viewRef: CustomizeGameViewController?
    var router: CustomizeGameRouter?
    var interactor: CustomizeGameInteractor?
    
    var playerName: String?
    
    func viewDidLoad() {
        
        CustomizeGameRouter.configureComponents(presenter: self)
    }
    
    func viewWillAppear(animated: Bool, navigationController: UINavigationController?) {
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func saveData(name: String, nQuestions: String, category: String) {
        
        playerName = name
        interactor?.getQuestions(nQuestions: nQuestions, category: category)
    }
    
    func navigateToQuestionsView(results: [TrivialResults]) {
        
        guard let sourceController = viewRef, let player = playerName else { return }
        router?.goToQuestions(playerName: player, results: results, fromController: sourceController)
    }
}
