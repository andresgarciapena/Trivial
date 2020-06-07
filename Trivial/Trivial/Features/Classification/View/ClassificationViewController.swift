//
//  ClassificationViewController.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 07/06/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

struct TypeCell {
    let identifier: String
    let playerScore: PlayerScoreModel?
}

class ClassificationViewController: UIViewController {
    
    @IBOutlet weak var classificationTableView: UITableView!
    
    // MARK: - Variable
    var presenter: ClassificationPresenter = ClassificationPresenter()
    
    var typeCellList: [TypeCell]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewRef = self
        presenter.viewDidLoad()
        
        configureView()
        
        presenter.getUsersScore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear(animated: animated, navigationController: navigationController)
    }
    
    // Configure view
    func configureView() {
        view.backgroundColor = UIColor.fromGradientWithDirection(.leftToRight, frame: view.frame, colors: [UIColor.cyan, UIColor.blue])
        navigationItem.title = "Classification"
        
        classificationTableView.register(UINib(nibName: "ClassificationHeaderCell", bundle: nil), forCellReuseIdentifier: Constants.headerCellIdentifier)
        classificationTableView.register(UINib(nibName: "PlayerScoreCell", bundle: nil), forCellReuseIdentifier: Constants.playerScoreCellIdentifier)
    }
}

extension ClassificationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let list = typeCellList {
            return list.count
        }
        return 0
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if let playerScore = typeCellList?[indexPath.row] {
            switch playerScore.identifier {
            case Constants.headerCellIdentifier:
                cell = getHeaderCell(tableView, cellForRowAt: indexPath)
            case Constants.playerScoreCellIdentifier:
                cell = getPlayerScoreCell(tableView, cellForRowAt: indexPath)
            default:
                cell = UITableViewCell()
            }
        }
        return cell
    }
    
    func getHeaderCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.headerCellIdentifier, for: indexPath) as! ClassificationHeaderCell
        
        cell.nameLabel.text = "Player name"
        cell.correctQuestions.text = "Correct Answers"
        cell.totalQuestions.text = "Total Questions"
        
        return cell
    }
    
    func getPlayerScoreCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let playerScore = typeCellList?[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.playerScoreCellIdentifier, for: indexPath) as! PlayerScoreCell
        
        cell.playerNameLabel.text = playerScore?.playerScore?.name
        cell.correctAnswersLabel.text = playerScore?.playerScore?.correctQuestions
        cell.totalQuestionsLabel.text = playerScore?.playerScore?.totalQuestions
        
        return cell
    }
}
