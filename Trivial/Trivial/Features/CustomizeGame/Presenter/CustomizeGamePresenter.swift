//
//  CustomizeGamePresenter.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit
import UIGradient

class CustomizeGamePresenter: CustomizeGameProtocol {
    
    var viewRef: CustomizeGameViewController?
    var router: CustomizeGameRouter?
    var interactor: CustomizeGameInteractor?
    
    var playerName: String?
    var maxQuestions: String?
    
    func viewDidLoad() {
        
        CustomizeGameRouter.configureComponents(presenter: self)
    }
    
    func viewWillAppear(animated: Bool, navigationController: UINavigationController?) {
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.barTintColor = UIColor.fromGradientWithDirection(.leftToRight, frame: (navigationController?.navigationBar.frame)!, colors: [UIColor.cyan, UIColor.blue])
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    func saveData(name: String, nQuestions: String, category: String) {
        
        playerName = name
        maxQuestions = nQuestions
        interactor?.getQuestions(nQuestions: nQuestions, category: category)
    }
    
    func navigateToQuestionsView(results: [TrivialResults]) {
        
        guard let sourceController = viewRef, let player = playerName, let numQuestions = maxQuestions else { return }
        router?.goToQuestions(playerName: player, maxQuestions: numQuestions, results: results, fromController: sourceController)
    }
}
