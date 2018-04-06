//
//  DataTableViewCell.swift
//  Alcoholic
//
//  Created by Varshit Rajput on 02/04/17.
//  Copyright © 2017 Varshit Rajput. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var quarter: UILabel!
    @IBOutlet weak var half: UILabel!
    @IBOutlet weak var full: UILabel!
    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var logoimage: UIImageView!
  



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
