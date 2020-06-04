//
//  TrivialResponse.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import Foundation

struct TrivialResponse: Decodable {
    
    let response_code: Int
    let results: [TrivialResults]
    
    enum CodingKeys: String, CodingKey {
        case response_code
        case results
    }
}

struct TrivialResults: Decodable {
    
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
    
    enum CodingKeys: String, CodingKey {
        case category
        case type
        case difficulty
        case question
        case correct_answer
        case incorrect_answers
    }
}
