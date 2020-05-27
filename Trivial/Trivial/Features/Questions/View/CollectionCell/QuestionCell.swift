//
//  QuestionCell.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import UIKit

class QuestionCell: UICollectionViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(nameLabel)
        
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
