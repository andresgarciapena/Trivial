//
//  CustomizeGameProtocol.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

protocol CustomizeGameProtocol {
    
    var viewRef: CustomizeGameViewController? {get set}
    var router: CustomizeGameRouter? {get set}
    var interactor: CustomizeGameInteractor? {get set}
    
    func viewDidLoad()
    func viewWillAppear(animated: Bool, navigationController: UINavigationController?)
    
    func saveData(name: String, nQuestions: String, category: String)
    func navigateToQuestionsView(results: [TrivialResults])
}

protocol CustomizeGamePresenterProtocol {
    
}

protocol CustomizeGameRouterProtocol {
    
    func goToQuestions(playerName: String, maxQuestions: String, results: [TrivialResults], fromController: CustomizeGameViewController)
}

protocol CustomizeGameInteractorProtocol {
    
    var presenter: CustomizeGamePresenter? {get set}
    
    func getQuestions(nQuestions: String, category: String)
}
