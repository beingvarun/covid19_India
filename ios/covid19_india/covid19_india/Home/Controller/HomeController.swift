//
//  ViewController.swift
//  covid19_india
//
//  Created by Varunraj on 21/06/2020.
//  Copyright © 2020 Varunraj. All rights reserved.
//

import UIKit

class HomeController: UIViewController{

    @IBOutlet weak var dateAndStatus: UILabel!
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var deceasedLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    var covidManager = CovidManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        covidManager.delegate = self
        dateAndStatus.text = "Covid 19 Analysis \(getTimeAndDate())"
         getCurrentData()
    }
    
    //MARK:- get current Time-Date Data
    
    func getTimeAndDate()->String{
        let now = Date()

              let formatter = DateFormatter()
              formatter.dateStyle = .full
              formatter.timeStyle = .full
              let datetime = formatter.string(from: now)
        return datetime
  
    }
    
    
    //MARK:- get the URL and update the current Data
    
    func getCurrentData(){
        covidManager.getUrl()
    }
    


}


//MARK:- covid Data Delegate protocol
extension HomeController : CovidDataDelegate{
    func updateCounts(covidData: CovidDataModel) {
        DispatchQueue.main.async {
            self.confirmedLabel.text = """
            Confirmed
            \( covidData.confirmed)
            """
                
               
            self.activeLabel.text = """
            Active
            \( covidData.active)
            """
            self.deceasedLabel.text = """
            Deceased
            \( covidData.deceased)
            """
            self.recoveredLabel.text = """
            Recovered
            \( covidData.recovered)
            """
        }
    }
    
    
}





