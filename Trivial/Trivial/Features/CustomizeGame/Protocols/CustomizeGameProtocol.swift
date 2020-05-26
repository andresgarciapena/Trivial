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
}

protocol CustomizeGamePresenterProtocol {
    
    
}

protocol CustomizeGameRouterProtocol {
    
    func goToQuestions(results: [TrivialResults], fromController: CustomizeGameViewController)
}

protocol CustomizeGameInteractorProtocol {
    
    var presenter: CustomizeGamePresenter? {get set}
    
    func getQuestions(nQuestions: String, category: String)
}
