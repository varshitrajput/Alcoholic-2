//
//  TableViewCell.swift
//  Alcoholic
//
//  Created by Varshit Rajput on 20/03/17.
//  Copyright © 2017 Varshit Rajput. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var episode: Episode! {
        didSet {
            self.updateUI()
        }
    }

    func updateUI()
    {
        textField.text = episode.name
        fullLabel.text = episode.full
        halfLabel.text = episode.half
        quaterLabel.text = episode.quarter
        if episode.category == "whisky"{
            sideCard2.image = UIImage(named: "whisky.png")
        }
        else if episode.category == "vodka"{
            sideCard2.image = UIImage(named: "vodka.png")

        }
        else if episode.category == "rum"{
            sideCard2.image = UIImage(named: "rum.png")
        }
        else if episode.category == "beer"{
            sideCard2.image = UIImage(named: "beer.png")
        }
        else if episode.category == "wine"{
            sideCard2.image = UIImage(named: "wine")
        }
        else if episode.category == "champ"{
            sideCard2.image = UIImage(named: "champ.png")
        }

    }

    @IBOutlet weak var sideCard1: UIImageView!
    @IBOutlet weak var sideCard2: UIImageView!
    @IBOutlet weak var card: UIImageView!
    @IBOutlet weak var textField: UILabel!
    @IBOutlet weak var halfLabel: UILabel!
    @IBOutlet weak var quaterLabel: UILabel!
    @IBOutlet weak var fullLabel: UILabel!




    override func awakeFromNib() {
        super.awakeFromNib()
      
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
