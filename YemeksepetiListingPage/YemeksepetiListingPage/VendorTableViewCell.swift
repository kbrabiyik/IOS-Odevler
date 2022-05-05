//
//  VendorTableViewCell.swift
//  YemeksepetiListingPage
//
//  Created by KUBRANIN MACİ on 5.05.2022.
//

import UIKit

class VendorTableViewCell: UITableViewCell {

    @IBOutlet weak var vendorCellBackground: UIView!
    @IBOutlet weak var deliveryFeeLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var minimumOrderValueLabel: UILabel!
    @IBOutlet weak var vendorCategoryLabel: UILabel!
    @IBOutlet weak var vendorNameLabel: UILabel!
    @IBOutlet weak var vendorScoreLabel: UILabel!
    @IBOutlet weak var vendorImageUIView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
