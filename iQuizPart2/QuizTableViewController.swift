//
//  QuizTableViewController.swift
//  iQuizPart2
//
//  Created by Andrew Yu on 11/12/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import UIKit

struct Question {
    var question : String
    var answers : [String]
    var correctAnswer : String
    var played: BooleanType;
}




class QuizTableViewController: UITableViewController {

    
    
    let quizNames = ["Math", "Science", "Marvel Super Heros"]
    let quizImages = [UIImage(named: "math"), UIImage(named: "science"), UIImage(named: "marvel")]
    let MathQuiz = [Question(question: "2+2?", answers: ["4","5", "6", "7"], correctAnswer: "4", played: false), Question(question:"4*4?", answers: ["16","22","124","0"], correctAnswer: "16", played: false)]
    
    let ScienceQuiz = [Question(question: "What is H20?", answers: ["Water","Shampoo", "Fire", "Rainbows"], correctAnswer: "Water", played: false), Question(question:"What helps grow muscles?", answers: ["French Fries","Protein","Potatoe Skins","Diet Coke"], correctAnswer: "Protein", played: false)]

    let MarvelQuiz = [Question(question: "What is Thor's weapon?", answers: ["Screwdriver","Ruler", "Hammer", "Nail"], correctAnswer: "Hammer", played: false), Question(question:"What is Iron Man's name?", answers: ["Peter Parker","Tony Stark","Harry Potter","Derry Cheng"], correctAnswer: "Tony Stark", played: false)]
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        self.navigationController?.navigationBar.topItem?.title = "Pick a quiz!"
        
   //Start TEST GLOB
        let nav = self.navigationController as! NavViewController
        print("\(nav.newQuiz)Derry Cheng")
        
   //End TEST GLOB

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.quizImages.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("quizCell", forIndexPath: indexPath) as! QuizCell
        cell.quizTitle.text = self.quizNames[indexPath.row]
        cell.quizImage.image = self.quizImages[indexPath.row]

        // Configure the cell...

        return cell
    }
    
    @IBAction func unwindTo(segue: UIStoryboardSegue) {
        print("Moved back to")
        
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "unwindTo Unwind Segue" {
            if let unwoundToMVC = segue.destinationViewController  as? SettingsViewController {
                
            }
        }
        
        if(segue.identifier == "settingsPopover"){
            
        } else {
        
        
            let cell = sender as! QuizCell
            
            let questionController = segue.destinationViewController as! QuestionViewController
            
            switch  cell.quizTitle.text! {
                case "Math" :
                    questionController.questions = self.MathQuiz
                    questionController.navigationItem.title = "Math Quiz"
                case "Science" :
                    questionController.questions = self.ScienceQuiz
                    questionController.navigationItem.title = "Science Quiz"
                case "Marvel Super Heros" :
                    questionController.questions = self.MarvelQuiz
                    questionController.navigationItem.title = "Marvel Super Heros Quiz"
                
            default :
                break
       
            }
            
        }

        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
