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
    
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var numberQuestionsLabel: UILabel!
    @IBOutlet weak var numberQuestionsTextField: UITextField!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var pickerContainer: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var okPickerButton: UIButton!
    
    // MARK: - Variable
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
    
    // Configure colors from all components in view
    func configureComponents() {
        view.backgroundColor = UIColor.fromGradientWithDirection(.leftToRight, frame: view.frame, colors: [UIColor.cyan, UIColor.blue])
        
        titleLabel.text = TLocalizedString("t_customize_title_label")
        userNameLabel.text = TLocalizedString("t_customize_username_label")
        numberQuestionsLabel.text = TLocalizedString("t_customize_number_label")
        categoryLabel.text = TLocalizedString("t_customize_category_label")
        
        startGameButton.layer.cornerRadius = 30
        startGameButton.layer.masksToBounds = true
        startGameButton.setTitle(TLocalizedString("t_customize_start_button"), for: .normal)
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
        pickerView.layer.borderWidth = 1
        pickerView.layer.borderColor = UIColor.black.cgColor
        
        playerNameTextField.keyboardType = .asciiCapable
        numberQuestionsTextField.keyboardType = .numberPad
    }
    
    // Alerts
    func showAlertPopup(state: Bool) {
        let title = TLocalizedString("t_customize_popup_title")
        let message = TLocalizedString("t_customize_popup_message")
        
        let popup = PopupDialog(title: title, message: message, image: nil)
        
        let buttonOne = DefaultButton(title: TLocalizedString("t_customize_popup_button")) {
            
        }
        
        popup.addButtons([buttonOne])
        
        self.present(popup, animated: true, completion: nil)
    }
    
    func showPicker() {
        pickerContainer.isHidden = false
    }
    
    func hidePicker() {
        pickerContainer.isHidden = true
        categoryTextField.resignFirstResponder()
    }

    // MARK: - IBActions
    @IBAction func startGameButtonAction(_ sender: Any) {
        
        guard let number = numberQuestionsTextField.text, let intNumber = Int(number) else { return }
        
        if categorySelected != 0 && intNumber <= 50 {
            saveConfigurationGame()
        } else {
            showAlertPopup(state: true)
        }
    }
    
    @IBAction func okPickerButtonAction(_ sender: Any) {
        
        hidePicker()
    }
    
    @IBAction func cancelPickerButtonAction(_ sender: Any) {
        
        hidePicker()
    }
}

// MARK: - UITextFieldDelegate
extension CustomizeGameViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        showPicker()
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
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
