//
//  QuestionsInteractor.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class QuestionsInteractor: QuestionsInteractorProtocol {
    
    var presenter: QuestionsPresenter?
    
    func uploadUserScore(playerName: String, numberOfQuestions: String, numberOfCorrectQuestions: String) {
        
        ScoreServiceManager.sharedService.uploadUserScoreApi(playerName: playerName, numberOfQuestions: numberOfQuestions, numberOfCorrectQuestions: numberOfCorrectQuestions) { (error) in
            
            if error == nil {
                
                self.presenter?.showPlayerScore()
            }
        }
    }
}
