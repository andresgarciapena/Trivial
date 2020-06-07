//
//  StartViewProtocols.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

protocol StartViewProtocol {
    
    var viewRef: StartViewController? {get set}
    var router: StartViewRouter? {get set}
    var interactor: StartViewInteractor? {get set}
    
    func viewDidLoad()
    func viewWillAppear(animated: Bool, navigationController: UINavigationController?)
    func navigateToNextView()
    func navigateToClassificationView()
}

protocol StartViewPresenterProtocol {
    
    
}

protocol StartViewRouterProtocol {
    
    func goToCustomizeGame(fromController: StartViewController)
    func goToClassification(fromController: StartViewController)
}
