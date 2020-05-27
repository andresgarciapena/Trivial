//
//  Constants.swift
//  Trivial
//
//  Created by Andres Garcia Peña on 26/05/2020.
//  Copyright © 2020 Andres Garcia. All rights reserved.
//

import Foundation

struct PickerData {
    var name: String
    var number: Int
}

struct Constants {

    static let apiUrl = "https://opentdb.com/api.php?amount=%@&category=%@"
    
    static var pickerData: [PickerData] = [PickerData(name: "", number: 0),
                                            PickerData(name: "Mythology", number: 20),
                                            PickerData(name: "Sports", number: 21),
                                            PickerData(name: "Geography", number: 22),
                                            PickerData(name: "History", number: 23),
                                            PickerData(name: "Art", number: 24)]
}
