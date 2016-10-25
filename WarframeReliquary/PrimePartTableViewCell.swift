//
//  PrimePartTableViewCell.swift
//  WarframeReliquary
//
//  Created by Anthony Whitaker on 10/24/16.
//  Copyright © 2016 Anthony Whitaker. All rights reserved.
//

import UIKit

class PrimePartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var partNameLabel: UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    
    var item: Item!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(item: Item) {
        self.item = item
        partNameLabel.text = item.description
        favoriteSwitch.setOn(item.isFavorite, animated: false)
    }

}