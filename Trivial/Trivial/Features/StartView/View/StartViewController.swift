//
//  StartViewController.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit
import UIGradient

class StartViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createGameButton: UIButton!
    @IBOutlet weak var classificationButton: UIButton!
    
    // MARK: - Variable
    var presenter: StartViewPresenter = StartViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewRef = self
        presenter.viewDidLoad()
        
        configureComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear(animated: animated, navigationController: navigationController)
    }
    
    // Configure colors from all components in view
    func configureComponents() {
        view.backgroundColor = UIColor.fromGradientWithDirection(.topLeftToBottomRight, frame: view.frame, colors: [UIColor.blue, UIColor.orange, UIColor.green])
        
        titleLabel.textColor = UIColor.fromGradientWithDirection(.leftToRight, frame: view.frame, colors: [UIColor.green, UIColor.yellow])
        
        createGameButton.layer.cornerRadius = 30
        createGameButton.layer.masksToBounds = true
        createGameButton.setTitle("Create Game", for: .normal)
        
        classificationButton.layer.cornerRadius = 30
        classificationButton.layer.masksToBounds = true
        classificationButton.setTitle("Classification", for: .normal)
    }

    // MARK: - IBActions
    // Navigation to start configuration game
    @IBAction func createGameButtonAction(_ sender: Any) {
        
        presenter.navigateToNextView()
    }
    
    @IBAction func classificationButtonAction(_ sender: Any) {
        
        presenter.navigateToClassificationView()
    }
}
