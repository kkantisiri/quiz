//
//  Quiz.swift
//  Quiz
//
//  Created by UCode on 5/26/18.
//  Copyright © 2018 Kenny K. All rights reserved.
//

import Foundation

class Quiz {
    var questions: [Question]
    var score: Int
    var currentQuestionIndex: Int
    
    var currentQuestion: Question {
        return questions[currentQuestionIndex]
    }
    var currentQuestionNumber: Int {
        return currentQuestionIndex + 1
    }
    
    init(questions: [Question]){
        self.questions            = questions
        self.score                = 0
        self.currentQuestionIndex = 0
    }
    
    func reset() {
        score                = 0
        currentQuestionIndex = 0
    }
    func next() {
        currentQuestionIndex += 1
    }
    
    
}

