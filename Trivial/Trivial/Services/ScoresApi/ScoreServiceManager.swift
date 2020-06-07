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
        
        let ref = Database.database().reference().child("message")
        let childRef = ref.childByAutoId()
        
        let values = ["name": playerName, "totalQuestions": numberOfQuestions, "correctQuestions": numberOfCorrectQuestions] as [String: AnyObject]
        
        childRef.updateChildValues(values) { (error, ref) in
            
            completionHandler(error)
        }
    }
    
    func getUsersScoreApi(completionHandler: @escaping (UserScoreResponse?, Error?) -> Void) {
        
        let ref = Database.database().reference().child("message")
        ref.observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: String] {
                guard let name = dictionary["name"], let totalQuestions = dictionary["totalQuestions"], let correctQuestions = dictionary["correctQuestions"] else { return }
                
                let userScoreResponse = UserScoreResponse(name: name, totalQuestions: totalQuestions, correctQuestions: correctQuestions)
                
                print(name, totalQuestions, correctQuestions)
                completionHandler(userScoreResponse, nil)
            }
            
        }, withCancel: nil)
    }
}
