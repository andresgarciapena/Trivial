//
//  QuestionsModel.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answers: [String]
    let correct: String
}

class QuestionsModel {
    
    var questionList: [Question] = []
    
    var namePlayer1: String = ""
    
    var scorePlayer1: Int = 0
    
    init(questions: [TrivialResults]) {
        for question in questions {
            var answers = question.incorrect_answers
            answers.append(question.correct_answer)
            answers.shuffle()
            let newQuestion = Question(question: question.question, answers: answers, correct: question.correct_answer)
            questionList.append(newQuestion)
        }
    }
}
