//
//  ResultsViewController.swift
//  Quiz
//
//  Created by UCode on 6/9/18.
//  Copyright © 2018 Kenny K. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    var quiz: Quiz!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showResults()
    }
    
    func showResults() {
        scoreLabel.text = "\(quiz.score)"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
