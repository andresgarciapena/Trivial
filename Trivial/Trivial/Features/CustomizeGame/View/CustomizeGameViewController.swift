//
//  CustomizeGameViewController.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit
import PopupDialog

class CustomizeGameViewController: UIViewController {
    
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var numberQuestionsTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var pickerContainer: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var okPickerButton: UIButton!
    
    var presenter: CustomizeGamePresenter = CustomizeGamePresenter()
    
    var categorySelected: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewRef = self
        presenter.viewDidLoad()
        configureView()
        configureComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear(animated: animated, navigationController: navigationController)
    }
    
    func configureComponents() {
        view.backgroundColor = UIColor.fromGradientWithDirection(.leftToRight, frame: view.frame, colors: [UIColor.cyan, UIColor.blue])
        
        startGameButton.layer.cornerRadius = 30
        startGameButton.layer.masksToBounds = true
        startGameButton.setTitle("Start Game", for: .normal)
    }
    
    @objc func showPicker() {
        pickerContainer.isHidden = false
    }
    
    func saveConfigurationGame() {
        guard let name = playerNameTextField.text, let nQuestions = numberQuestionsTextField.text else { return }
        
        if name.isEmpty || nQuestions.isEmpty {
            
        } else {
            presenter.saveData(name: name, nQuestions: nQuestions, category: String(categorySelected))
        }
    }
    
    func configureView() {
        categoryTextField.delegate = self
        categoryTextField.tintColor = UIColor.clear
        
        pickerContainer.isHidden = true
        
        playerNameTextField.keyboardType = .asciiCapable
        numberQuestionsTextField.keyboardType = .numberPad
    }
    
    func showAlertPopup(state: Bool) {
        let title = "Queck the fields!!"
        let message = "Max number question or category are incorrect"
        
        let popup = PopupDialog(title: title, message: message, image: nil)
        
        let buttonOne = DefaultButton(title: "Continue") {
            
        }
        
        popup.addButtons([buttonOne])
        
        self.present(popup, animated: true, completion: nil)
    }

    @IBAction func startGameButtonAction(_ sender: Any) {
        
        guard let number = numberQuestionsTextField.text, let intNumber = Int(number) else { return }
        
        if categorySelected != 0 && intNumber <= 50 {
            saveConfigurationGame()
        } else {
            showAlertPopup(state: true)
        }
    }
    
    @IBAction func okPickerButtonAction(_ sender: Any) {
        
        pickerContainer.isHidden = true
        categoryTextField.resignFirstResponder()
    }
}

extension CustomizeGameViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        showPicker()
    }
}

extension CustomizeGameViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return Constants.pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        categoryTextField.text = Constants.pickerData[row].name
        return Constants.pickerData[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        categorySelected = Constants.pickerData[row].number
    }
}
