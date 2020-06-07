//
//  ClassificationRouter.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 07/06/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import Foundation

class ClassificationRouter {
 
    class func configureComponents(presenter: ClassificationPresenter) {
         
         presenter.router = ClassificationRouter()
         presenter.interactor = ClassificationInteractor()
         presenter.interactor?.presenter = presenter
     }
}
