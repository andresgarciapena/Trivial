//
//  ClassificationInteractor.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 07/06/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import Foundation

class ClassificationInteractor {
    
    var presenter: ClassificationPresenter?
    
    var playerScoreList: [PlayerScoreModel] = []
    
    func getScores() {
        
        ScoreServiceManager.sharedService.getUsersScoreApi { (userScoreResponse, error) in
            
            guard let response = userScoreResponse else { return }
            let playerScore = PlayerScoreModel(name: response.name, totalQuestions: response.totalQuestions, correctQuestions: response.correctQuestions)
            self.playerScoreList.append(playerScore)
            
            self.presenter?.returnPlayerScoreList(list: self.playerScoreList)
        }
    }
}
