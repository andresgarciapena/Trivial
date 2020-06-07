//
//  UserScoreResponse.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 04/06/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import Foundation

struct UserScoreResponse: Decodable {
    
    let name: String
    let totalQuestions: String
    let correctQuestions: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case totalQuestions
        case correctQuestions
    }
}
