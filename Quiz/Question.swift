//
//  Question.swift
//  Quiz
//
//  Created by UCode on 5/26/18.
//  Copyright © 2018 Kenny K. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var answers: [Answer]
    
    func check(answerIndex:Int) -> Bool {
        return answers[answerIndex].isCorrect
    }
    
}

