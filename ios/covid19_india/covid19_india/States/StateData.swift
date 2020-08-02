//
//  StateData.swift
//  covid19_india
//
//  Created by Varunraj on 01/08/2020.
//  Copyright © 2020 Varunraj. All rights reserved.
//

import Foundation

struct StateData:Codable {
    let statewise: [Statewise]
}


struct Statewise :Codable {
    let state : String
    let active: String
    let confirmed : String
    let deaths: String
    let recovered : String
}
