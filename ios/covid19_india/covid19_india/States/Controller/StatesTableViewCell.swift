//
//  StatesTableViewCell.swift
//  covid19_india
//
//  Created by Varunraj on 01/08/2020.
//  Copyright © 2020 Varunraj. All rights reserved.
//

import UIKit

class StatesTableViewCell: UITableViewCell {

    @IBOutlet weak var stateNameLabel: UILabel!
    @IBOutlet weak var stateImage: UIImageView!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        stateImage.layer.cornerRadius = 20
        // Initialization code
        //stateButton.tintColor = UIColor.white
        
        //stateButton.imageView?.contentMode = .scaleAspectFill
        //myButton.imageView?.contentMode = .scaleAspectFill
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
