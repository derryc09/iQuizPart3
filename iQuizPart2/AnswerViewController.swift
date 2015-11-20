//
//  AnswerViewController.swift
//  iQuizPart2
//
//  Created by Andrew Yu on 11/12/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var yourAnswer: UILabel!
    
    var correctAnswer = String()
    var selectedAnswer = String()
    var questions = [Question]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if selectedAnswer == correctAnswer {
            self.correctLabel.text = "Correct!"
            self.yourAnswer.text = "You chose \(selectedAnswer) which was right!"
        } else {
            self.correctLabel.text = "Nope"
            self.yourAnswer.text = "You chose \(selectedAnswer), the answer was \(correctAnswer)"
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
  
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//
//        
//        
//
//    }


}
