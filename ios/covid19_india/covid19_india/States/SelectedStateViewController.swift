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
            stateConfirmed.text = "CONFIRMED :  \(stateData.confirmed)"
            stateActive.text = "ACTIVE : \(stateData.active)"
            stateRecovered.text = "RECOVERED : \(stateData.recovered)"
            stateDeceased.text = "DECEASED :  \(stateData.deceased)"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
