//
//  QuestionViewController.swift
//  iQuizPart3
//
//  Created by Andrew Yu on 11/12/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var questions = [Question]()

    var selectedAnswer = String()
    var correctAnswer = String()
    
    var row = Int()
    var questionsCount = Int()
    var correctlyAnswered = 0
    var questionsPlayed = 0
    
    
    

    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBOutlet weak var submit: UIButton!
    
    
    @IBOutlet weak var chosen: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        for button in self.view.subviews {
            if button.isKindOfClass(UIButton) {
                let b = button as! UIButton
                b.addTarget(self, action: "changeLabel:", forControlEvents: UIControlEvents.TouchUpInside)
                b.hidden = true
                
            }
        }
        
        let nav = self.navigationController as! NavViewController
        //print("\(nav.newQuiz)Derry Cheng")
        
        
        
        score.textColor = UIColor.blackColor()
        score.text = "Out of the \(questions.count) questions we have, you have played \(questionsPlayed) of them and answered \(correctlyAnswered) of them correctly"
        submit.addTarget(self, action: "moveToAnswer:", forControlEvents: UIControlEvents.TouchUpInside)
        submit.setTitle("Submit", forState: .Normal)
        chosen.hidden = true
    }
    
    func changeLabel (sender: UIButton){
        if(sender.titleLabel?.text != "Submit"){
            selectedAnswer = (sender.titleLabel?.text)!
            chosen.text = "You have chosen: \(sender.titleLabel!.text!)"
        }
        submit.hidden = false
        chosen.hidden = false
    }
    
    
    func moveToAnswer(sender : UIButton) {
        self.performSegueWithIdentifier("goToAnswer", sender: sender)
    }


    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("quizCell") as! QuizCell
        
        let q = self.questions[indexPath.row]
        cell.quizTitle.text = q.question
        
        self.correctAnswer = q.correctAnswer
        return cell
     }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questions.count
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        chosen.hidden = true
        submit.hidden = true
        let q = questions[indexPath.row]
        correctAnswer = q.correctAnswer
        row = indexPath.row
        
        self.answer1.hidden = false
        self.answer2.hidden = false
        self.answer3.hidden = false
        self.answer4.hidden = false
        
        self.answer1.setTitle(q.answers[0], forState: .Normal)
        self.answer2.setTitle(q.answers[1], forState: .Normal)
        self.answer3.setTitle(q.answers[2], forState: .Normal)
        self.answer4.setTitle(q.answers[3], forState: .Normal)
        
        
//        self.answer1.titleLabel?.text = q.answers[0]
//        self.answer2.titleLabel?.text = q.answers[1]
//        self.answer3.titleLabel?.text = q.answers[2]
//        self.answer4.titleLabel?.text = q.answers[3]

    }

    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        let view = segue.destinationViewController as! AnswerViewController
        
        
        if(selectedAnswer == correctAnswer && questions[row].played.boolValue == false){
            questions[row].played = true
            correctlyAnswered++
            questionsPlayed++
            
        } else if (questions[row].played.boolValue == false){
            questions[row].played = true
            questionsPlayed++

        }
        score.text = "Out of the \(questions.count) questions we have, you have played \(questionsPlayed) of them and answered \(correctlyAnswered) of them correctly"
        
        if(questionsPlayed == questions.count){
            score.textColor = UIColor.redColor()
            
            score.text = "You have completed the quiz!! Out of the \(questions.count) questions we have, you have played \(questionsPlayed) of them and answered \(correctlyAnswered) of them correctly"
        }
        view.selectedAnswer = selectedAnswer
        view.correctAnswer = self.correctAnswer
    
        
    }
  

}
