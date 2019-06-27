//
//  vendorCell.swift
//  QB-marketAnalysis
//
//  Created by GUPTA, AKSHAT on 27/06/19.
//  Copyright © 2019 GUPTA, AKSHAT. All rights reserved.
//

import UIKit

class vendorCell: UITableViewCell {

    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
