//
//  TableViewCell2.swift
//  Alcoholic
//
//  Created by Varshit Rajput on 22/03/17.
//  Copyright © 2017 Varshit Rajput. All rights reserved.
//

import UIKit

class TableViewCell2: UITableViewCell {

    @IBOutlet weak var textField: UILabel!
    @IBOutlet weak var fullLabel: UILabel!
    @IBOutlet weak var halfLabel: UILabel!

    @IBOutlet weak var quaterLabel: UILabel!

    @IBOutlet weak var logoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
