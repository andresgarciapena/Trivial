//
//  QuestionsViewController.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit
import PopupDialog

class QuestionsViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var questionCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "cell"
    
    private let sectionInsets = UIEdgeInsets(top: 10.0,left: 20.0,bottom: 10.0,right: 20.0)
    private let itemsPerRow: CGFloat = 2
    
    var questionsModel: QuestionsModel?
    
    var question: Question?
    
    var presenter: QuestionsPresenter = QuestionsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(QuestionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        presenter.viewRef = self
        presenter.viewDidLoad()
        presenter.saveData(questionsModel: questionsModel)
        
        configureComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear(animated: animated, navigationItem: navigationItem)
        
        question = presenter.getNextQuestion()
        refreshScreen()
        collectionView.reloadData()
    }
    
    func configureComponents() {
        view.backgroundColor = UIColor.fromGradientWithDirection(.leftToRight, frame: view.frame, colors: [UIColor.cyan, UIColor.blue])
        collectionView.backgroundColor = UIColor.fromGradientWithDirection(.leftToRight, frame: view.frame, colors: [UIColor.cyan, UIColor.blue])
        topView.backgroundColor = UIColor.fromGradientWithDirection(.leftToRight, frame: view.frame, colors: [UIColor.cyan, UIColor.blue])
    }

    func showIfYouGotItRight(correct: Bool, collectionView: UICollectionView, indexPath: IndexPath) {
        if correct {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.backgroundColor = UIColor.green
            presenter.updateQuestionAndPlayerScore(numQuestion: 1, score: 1)
            refreshScreen()
        } else {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.backgroundColor = UIColor.red
            presenter.updateQuestionAndPlayerScore(numQuestion: 1, score: 0)
            if let question = question {
                for c in collectionView.visibleCells {
                    if (c as! QuestionCell).nameLabel.text == question.correct {
                        c.backgroundColor = UIColor.green
                    }
                }
                refreshScreen()
            }
        }
    }
    
    func refreshScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.scoreLabel.text = "Score: " + String(self.presenter.getScore())
            let question = self.presenter.getNextQuestion()
            if question == nil {
                
                self.showResultPopup(result: String(self.presenter.getScore()))
            } else {
                
                self.questionCountLabel.text = String(format: "Question: %d / %@", self.presenter.getQuestionCount(), self.presenter.getMaxQuestions())
                self.question = question
                self.collectionView.reloadData()
            }
        })
    }
    
    func showResultPopup(result: String) {
        let title = "You complete all the questions!"
        let message = "Your score is: " + result
        
        let popup = PopupDialog(title: title, message: message, image: nil)
        
        let buttonOne = DefaultButton(title: "New Game") {
            self.presenter.startNewGame()
        }
        
        popup.addButtons([buttonOne])
        
        self.present(popup, animated: true, completion: nil)
    }
}

extension QuestionsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let question = question {
            return question.answers.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! QuestionCell
        
        if let question = question {
            cell.nameLabel.text = question.answers[indexPath.row]
            questionLabel.text = question.question
        }
        
        cell.backgroundColor = UIColor.yellow
        cell.alpha = 0.5
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let question = question {
            guard let result = presenter.validateQuestion(question: question, indexPath: indexPath) else { return }
            showIfYouGotItRight(correct: result, collectionView: collectionView, indexPath: indexPath)
        }
    }
}

extension QuestionsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
      let availableWidth = view.frame.width - paddingSpace
      let widthPerItem = availableWidth / itemsPerRow
      
      return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return sectionInsets.left
    }
}
