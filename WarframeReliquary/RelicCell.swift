//
//  RelicCell.swift
//  WarframeReliquary
//
//  Created by Anthony Whitaker on 10/15/16.
//  Copyright © 2016 Anthony Whitaker. All rights reserved.
//

import UIKit

class RelicCell : UICollectionViewCell {
    var relic: Relic!
    
    func configureCell(relic: Relic) {
        self.relic = relic
    }
    
    func image(for relic: Relic) -> UIImage {
        var image: UIImage
        switch relic.key.tier! {
        case .Lith:
            image = #imageLiteral(resourceName: "Lith_Intact")
        case .Meso:
            image = #imageLiteral(resourceName: "Meso_Intact")
        case .Neo:
            image = #imageLiteral(resourceName: "Neo_Intact")
        case .Axi:
            image = #imageLiteral(resourceName: "Axi_Intact")
        }
        return image
    }
}
