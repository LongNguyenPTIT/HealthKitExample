//
//  ProfileCell.swift
//  HealthKitExample
//
//  Created by Nguyen Nam Long on 10/28/16.
//  Copyright © 2016 Nguyen Nam Long. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var clickButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
