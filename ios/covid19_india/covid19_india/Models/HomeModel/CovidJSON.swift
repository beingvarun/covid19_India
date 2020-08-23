//
//  covidJSON.swift
//  covid19_india
//
//  Created by Varunraj on 03/07/2020.
//  Copyright © 2020 Varunraj. All rights reserved.
//

import Foundation

struct CovidJSON:Decodable{
    let confirmed:Int
    let recovered:Int
    let active:Int
    let deaths:Int
}
