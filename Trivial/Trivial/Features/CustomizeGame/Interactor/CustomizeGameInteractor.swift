//
//  CustomizeGameInteractor.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class CustomizeGameInteractor: CustomizeGameInteractorProtocol {
    
    var presenter: CustomizeGamePresenter?
    
    func getQuestions(nQuestions: String, category: String) {
        
        TrivialServiceManager.sharedService.requestApi(numberQuestions: nQuestions, category: category, completionHandler: {(trivialResponse, error) -> Void in
        
            DispatchQueue.main.async {
                
                if let results = trivialResponse?.results {
                    
                    self.presenter?.navigateToQuestionsView(results: results)
                }
            }
        })
    }
}
