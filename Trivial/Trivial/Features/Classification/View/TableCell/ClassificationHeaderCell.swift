//
//  ClassificationHeaderCell.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 07/06/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class ClassificationHeaderCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var correctQuestions: UILabel!
    @IBOutlet weak var totalQuestions: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
