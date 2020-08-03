//
//  StatesViewController.swift
//  covid19_india
//
//  Created by Varunraj on 01/08/2020.
//  Copyright © 2020 Varunraj. All rights reserved.
//

import UIKit

class StatesViewController: UIViewController {
    
    var stateManager = StateManager()
    
    var updated_CleanData:[StateDataModel]?
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
         loadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        stateManager.newdelegate = self
       
        tableView.allowsSelection = true
        tableView.register(UINib(nibName: "StatesTableViewCell", bundle: nil), forCellReuseIdentifier: "stateIdentifier")
      
        
        
    }
    
    func loadData(){
        stateManager.getAPI()
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

//MARK:- tableView methods and delegates

extension StatesViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return updated_CleanData?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "stateIdentifier", for: indexPath) as! StatesTableViewCell
        
        DispatchQueue.main.async {
            
            if let total_Data = self.updated_CleanData{
                       cell.stateNameLabel.text = total_Data[indexPath.row].stateName
                   }
            
        }
        
       
        
        return cell
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          performSegue(withIdentifier: "goToState", sender: self)
      }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let stateVC = segue.destination as! SelectedStateViewController
        if let currentSelected = tableView.indexPathForSelectedRow{
            print()
            if let stateData = updated_CleanData{
                //print(stateData[currentSelected[1]])
                stateVC.selectedState  =  stateData[currentSelected[1]]
               
            }
            
        }
    }
   
    
    
    
    
}

extension StatesViewController : StateDataDelegate{
    func updateStateCounts(covidCleanData: [StateDataModel]) {
        updated_CleanData = covidCleanData
       
    }
 
    
}



//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//      let itemVC = segue.destination as! TodeyListViewController
//      if let currentSelected = tableView.indexPathForSelectedRow{
//          itemVC.mySelectedCategory = categories[currentSelected.row]
//      }
