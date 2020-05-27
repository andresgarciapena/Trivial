//
//  QuestionsViewController.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear(animated: animated, navigationItem: navigationItem)
        
        question = presenter.getNextQuestion()
        collectionView.reloadData()
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
                print("Finish")
            } else {
                self.questionCountLabel.text = String(format: "Question: %d / 5", self.presenter.getQuestionCount())
                self.question = question
                self.collectionView.reloadData()
            }
        })
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
