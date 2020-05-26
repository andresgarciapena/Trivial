//
//  StartViewController.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var createGameButton: UIButton!
    
    var presenter: StartViewPresenter = StartViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewRef = self
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear(animated: animated, navigationController: navigationController)
    }

    @IBAction func createGameButtonAction(_ sender: Any) {
        
        presenter.navigateToNextView()
    }
}
