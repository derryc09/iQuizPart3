//
//  ViewController.swift
//  iQuizPart2
//
//  Created by Andrew Yu on 11/12/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    
    var newQuiz = [AnyObject]()
    
    
    @IBAction func downloadNewQuestions(sender: AnyObject) {
        
        let newURL = self.urlTextField.text
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        let URL = NSURL(string: newURL!)
        let request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "GET"
        
        
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            //Success
            let statusCode = (response as! NSHTTPURLResponse).statusCode
            
            print("URL SessionTask Succeeded: HTTP \(statusCode)")
            
            do {
                var parseError: NSError?
                
                self.newQuiz = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
                let jsonObj = self.newQuiz
                
                for subject in jsonObj {
//                    
//                    let title = subject["title"]!
//                    print("\(title)")
//                    let desc = subject["desc"]
//                    print("\(desc)")
//                    
//                    let questions = subject["questions"]
//                    print("\(questions)")
//                    
//                    for question in questions as! NSArray{
//                        let answers = question["answers"]
//                        let answer = question["answer"]
//                        let text = question["text"]
//                        
//                        print("Answer: \(answer)")
//                        print ("Text: \(text)")
//                        for choice in answers as! NSArray{
//                            print("Choices: \(choice)")
//                        }
//                    }
                    
                    
                    
                    let navController : NavViewController = self.view.window?.rootViewController as! NavViewController
                    navController.newQuiz = self.newQuiz
                    
                    
                    //print("\(navController.newQuiz) blablablabalbalab625346923764596872345789234")
                    
                    
                }
                
                
               //print(self.newQuiz)

            } catch let error as NSError{
                
                print("Failed to load: \(error.localizedDescription)")
            }

        }
        task.resume()
        

    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.urlTextField.text = "http://tednewardsandbox.site44.com/questions.json"

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
      
        
        
    }


}

