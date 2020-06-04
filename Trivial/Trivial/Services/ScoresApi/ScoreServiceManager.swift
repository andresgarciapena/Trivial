//
//  ScoreServiceManager.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 04/06/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import Foundation
import Firebase

class ScoreServiceManager {
    
    static let sharedService = ScoreServiceManager()
    
    func uploadUserScoreApi(playerName: String, numberOfQuestions: String, numberOfCorrectQuestions: String, completionHandler: @escaping (Error?) -> Void) {
        
        let ref = Database.database().reference().child("scoreList")
        let childRef = ref.childByAutoId()
        
        let values = ["name": playerName, "totalQuestions": numberOfQuestions, "correctQuestions": numberOfCorrectQuestions] as [String: AnyObject]
        
        childRef.updateChildValues(values) { (error, ref) in
            
            completionHandler(error)
        }
    }
}
