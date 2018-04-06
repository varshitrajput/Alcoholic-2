//
//  TableViewCell3.swift
//  Alcoholic
//
//  Created by Varshit Rajput on 23/03/17.
//  Copyright © 2017 Varshit Rajput. All rights reserved.
//

import UIKit

class TableViewCell3: UITableViewCell {

    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var content: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
