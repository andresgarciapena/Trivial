//
//  CustomizeGameViewController.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class CustomizeGameViewController: UIViewController {
    
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var numberQuestionsTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var startGameButton: UIButton!
    
    var presenter: CustomizeGamePresenter = CustomizeGamePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewRef = self
        presenter.viewDidLoad()
        configureTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear(animated: animated, navigationController: navigationController)
    }
    
    func saveConfigurationGame() {
        guard let name = playerNameTextField.text, let nQuestions = numberQuestionsTextField.text, let category = categoryTextField.text else { return }
        
        presenter.saveData(name: name, nQuestions: nQuestions, category: category)
    }
    
    func configureTextField() {
        playerNameTextField.keyboardType = .asciiCapable
        numberQuestionsTextField.keyboardType = .numberPad
    }

    @IBAction func startGameButtonAction(_ sender: Any) {
        
        saveConfigurationGame()
    }
}
