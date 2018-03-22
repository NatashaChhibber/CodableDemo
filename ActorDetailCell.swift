//
//  ActorDetailCell.swift
//  Codable_Demo
//
//  Created by Appinventiv on 22/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ActorDetailCell: UITableViewCell {

    @IBOutlet weak var CountryLabel: UILabel!
    @IBOutlet weak var DOBLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ActorImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ActorImageView.layer.cornerRadius = 8
        ActorImageView.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
