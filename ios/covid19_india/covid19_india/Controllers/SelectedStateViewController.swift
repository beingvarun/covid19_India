//
//  SelectedStateViewController.swift
//  covid19_india
//
//  Created by Varunraj on 02/08/2020.
//  Copyright © 2020 Varunraj. All rights reserved.
//

import UIKit

class SelectedStateViewController: UIViewController {
    
    @IBOutlet weak var stateConfirmed: UILabel!
    @IBOutlet weak var stateActive: UILabel!
    @IBOutlet weak var stateRecovered: UILabel!
    @IBOutlet weak var stateDeceased: UILabel!
    @IBOutlet weak var Districtwise: UIButton!
    var selectedState:StateDataModel?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        if let stateData = selectedState{
            stateConfirmed.text = "Confirmed :  \(stateData.confirmed)"
            stateActive.text = "Active : \(stateData.active)"
            stateRecovered.text = "Recovered : \(stateData.recovered)"
            stateDeceased.text = "Deceased :  \(stateData.deceased)"
        }
    }
    


}
