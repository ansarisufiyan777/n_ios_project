//
//  CustomeCell.swift
//  NimatCollege
//
//  Created by Asna Euphoria on 10/19/16.
//  Copyright © 2016 sufiyan. All rights reserved.
//

import UIKit

class CustomeCell: UITableViewCell {
    @IBOutlet weak var gender: UILabel!

    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var address: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
