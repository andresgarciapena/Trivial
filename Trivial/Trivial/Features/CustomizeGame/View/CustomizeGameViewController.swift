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
    @IBOutlet weak var pickerContainer: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var okPickerButton: UIButton!
    
    var presenter: CustomizeGamePresenter = CustomizeGamePresenter()
    
    //var pickerData: [PickerData] = [PickerData(name: "Dato1", number: 1), PickerData(name: "Dato2", number: 2)]
    var categorySelected: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewRef = self
        presenter.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear(animated: animated, navigationController: navigationController)
    }
    
    @objc func showPicker() {
        pickerContainer.isHidden = false
    }
    
    func saveConfigurationGame() {
        guard let name = playerNameTextField.text, let nQuestions = numberQuestionsTextField.text, let category = categoryTextField.text else { return }
        
        if name.isEmpty || nQuestions.isEmpty || category.isEmpty {
            
        } else {
            presenter.saveData(name: name, nQuestions: nQuestions, category: category)
        }
    }
    
    func configureView() {
        categoryTextField.delegate = self
        categoryTextField.tintColor = UIColor.clear
        
        pickerContainer.isHidden = true
        
        playerNameTextField.keyboardType = .asciiCapable
        numberQuestionsTextField.keyboardType = .numberPad
    }

    @IBAction func startGameButtonAction(_ sender: Any) {
        
        if categorySelected != 0 {
            saveConfigurationGame()
        } else {
            
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
