//
//  SelectedStateViewController.swift
//  covid19_india
//
//  Created by Varunraj on 02/08/2020.
//  Copyright © 2020 Varunraj. All rights reserved.
//

import UIKit

class SelectedStateViewController: UIViewController {
    
    var selectedState:StateDataModel?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        if let stateData = selectedState{
            print(stateData)
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
