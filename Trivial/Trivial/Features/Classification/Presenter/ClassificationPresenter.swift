//
//  ClassificationPresenter.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 07/06/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class ClassificationPresenter: ClassificationProtocol {

    var viewRef: ClassificationViewController?
    var router: ClassificationRouter?
    var interactor: ClassificationInteractor?

    func viewDidLoad() {
        
        ClassificationRouter.configureComponents(presenter: self)
    }
    
    func viewWillAppear(animated: Bool, navigationController: UINavigationController?) {
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.barTintColor = UIColor.fromGradientWithDirection(.leftToRight, frame: (navigationController?.navigationBar.frame)!, colors: [UIColor.cyan, UIColor.blue])
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    func getUsersScore() {
        
        interactor?.getScores()
    }
    
    func returnPlayerScoreList(list: [PlayerScoreModel]?) {
        
        var typeCellList: [TypeCell] = []
        
        typeCellList.append(TypeCell(identifier: Constants.headerCellIdentifier, playerScore: nil))
        
        if let playerScoreList = list {
            for item in playerScoreList {
                typeCellList.append(TypeCell(identifier: Constants.playerScoreCellIdentifier, playerScore: item))
            }
        }
        
        viewRef?.typeCellList = typeCellList
        viewRef?.classificationTableView.reloadData()
    }
}
