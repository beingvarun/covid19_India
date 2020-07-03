//
//  ViewController.swift
//  covid19_india
//
//  Created by Varunraj on 21/06/2020.
//  Copyright © 2020 Varunraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateAndStatus: UILabel!
    
    let covidManager = CovidManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        
        dateAndStatus.text = "Covid 19 Analysis \(getTimeAndDate())"
         getCurrentData()
    }
    
    func getTimeAndDate()->String{
        let now = Date()

              let formatter = DateFormatter()
              formatter.dateStyle = .full
              formatter.timeStyle = .full
              let datetime = formatter.string(from: now)
        return datetime
        
       
        
    }
    
    func getCurrentData(){
        covidManager.getUrl()
    }
    


}

