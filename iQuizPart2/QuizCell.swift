//
//  QuizCell.swift
//  iQuizPart2
//
//  Created by Andrew Yu on 11/12/15.
//  Copyright © 2015 Derry Cheng. All rights reserved.
//

import UIKit

class QuizCell: UITableViewCell {

    @IBOutlet weak var quizTitle: UILabel!
    @IBOutlet weak var quizImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
