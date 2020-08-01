//
//  StatesViewController.swift
//  covid19_india
//
//  Created by Varunraj on 01/08/2020.
//  Copyright © 2020 Varunraj. All rights reserved.
//

import UIKit

class StatesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "StatesTableViewCell", bundle: nil), forCellReuseIdentifier: "stateIdentifier")
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



extension StatesViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateIdentifier", for: indexPath) as! StatesTableViewCell
        //cell?.textLabel?.text = "kerala"
        return cell
    }
    
    
    
    
    
}
