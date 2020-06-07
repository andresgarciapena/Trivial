//
//  ClassificationProtocol.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 07/06/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import Foundation

protocol ClassificationProtocol {
    
    var viewRef: ClassificationViewController? {get set}
    var router: ClassificationRouter? {get set}
    var interactor: ClassificationInteractor? {get set}
    
    func viewDidLoad()
    func getUsersScore()
    func returnPlayerScoreList(list: [PlayerScoreModel]?)
}
