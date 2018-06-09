//
//  QuizViewController.swift
//  Quiz
//
//  Created by UCode on 6/2/18.
//  Copyright © 2018 Kenny K. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerButton0: UIButton!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    
    let quiz = Quiz(questions: [
        Question(text: "When was America Discovered?", answers: [
            Answer(text: "1893", isCorrect: false),
            Answer(text: "2017", isCorrect: false),
            Answer(text: "1391", isCorrect: false),
            Answer(text: "1492", isCorrect: true)
        ]),
        Question(text: "Who discovered America?", answers: [
            Answer(text: "Christopher Columbus", isCorrect: true),
            Answer(text: "George Washington", isCorrect: false),
            Answer(text: "Henry Hudson", isCorrect: false),
            Answer(text: "John Cabot", isCorrect: false)
        ]),
        Question(text: "What year did California become a state?", answers: [
            Answer(text: "1502", isCorrect: false),
            Answer(text: "1850", isCorrect: true),
            Answer(text: "1913", isCorrect: false),
            Answer(text: "1498", isCorrect: false)
        ]),
        Question(text: "What was the first president to LIVE in the white house?", answers: [
            Answer(text: "Christopher Columbus", isCorrect: false),
            Answer(text: "George Washington", isCorrect: false),
            Answer(text: "Abraham Lincoln", isCorrect: false),
            Answer(text: "John Adams", isCorrect: true)
        ]),
        Question(text: "Which important document was signed in 1776?", answers: [
            Answer(text: "Declaration Of Independence", isCorrect: true),
            Answer(text: "Constitution of the United States", isCorrect: false),
            Answer(text: "Bill of Rights", isCorrect: false),
            Answer(text: "The Pledge of Allegiance", isCorrect: false)
        ]),
        Question(text: "Who was the 16th President of the United States", answers: [
            Answer(text: "Barack Obama", isCorrect: false),
            Answer(text: "George Washington", isCorrect: false),
            Answer(text: "Abraham Lincoln", isCorrect: true),
            Answer(text: "Theodore Roosevelt", isCorrect: false)
        ]),
        Question(text: "Who designed the Statue of Liberty?", answers: [
            Answer(text: "Frédéric Barthodi", isCorrect: true),
            Answer(text: "Frédéri Bartholdi", isCorrect: false),
            Answer(text: "Frédéric Bartholdi", isCorrect: false),
            Answer(text: "Fréd Barthold", isCorrect: false)
        ]),
        Question(text: "In what year was Abraham Lincoln assassinated", answers: [
            Answer(text: "1865", isCorrect: true),
            Answer(text: "1799", isCorrect: false),
            Answer(text: "1901", isCorrect: false),
            Answer(text: "He didn't get assassinated.", isCorrect: false)
        ]),
        Question(text: "When was George Washington born?", answers: [
            Answer(text: "February 22, 1732", isCorrect: true),
            Answer(text: "February 25, 1493", isCorrect: false),
            Answer(text: "April 1, 1729", isCorrect: false),
            Answer(text: "May 13, 1753", isCorrect: false)
        ]),
        Question(text: "Who was the president in 2014", answers: [
            Answer(text: "George Washington", isCorrect: false),
            Answer(text: "John Adams", isCorrect: false),
            Answer(text: "Donald Trump", isCorrect: false),
            Answer(text: "Barack Obama", isCorrect: true)
        ])
    ])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        show(question: quiz.currentQuestion)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func show (question: Question){
        questionLabel.text = question.text
        answerButton0.setTitle(question.answers[0].text, for: .normal)
        answerButton1.setTitle(question.answers[1].text, for: .normal)
        answerButton2.setTitle(question.answers[2].text, for: .normal)
        answerButton3.setTitle(question.answers[3].text, for: .normal)
    }
    
    func next() {
        quiz.next()
        show(question: quiz.currentQuestion)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if quiz.currentQuestion.check(answerIndex:  sender.tag) {
            quiz.increaseScore()
        }
        if quiz.currentQuestionNumber < quiz.questions.count {
            next()
        }
        else {
            print("Out of Questions");
            print(quiz.score);
            performSegue(withIdentifier: "Show Results", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultsViewController = segue.destination as! ResultsViewController
        resultsViewController.quiz = quiz
    }

}
