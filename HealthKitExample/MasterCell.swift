//
//  MasterCell.swift
//  HealthKitExample
//
//  Created by Nguyen Nam Long on 10/27/16.
//  Copyright © 2016 Nguyen Nam Long. All rights reserved.
//

import UIKit

class MasterCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var authorButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func onAuthor(_ sender: AnyObject) {
        print("author recognized")
    }

}
