//
//  PlayerScoreCell.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 07/06/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class PlayerScoreCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var correctAnswersLabel: UILabel!
    @IBOutlet weak var totalQuestionsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
