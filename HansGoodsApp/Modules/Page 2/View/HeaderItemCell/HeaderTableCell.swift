//
//  HeaderTableCell.swift
//  HansGoodsApp
//
//  Created by Farhan Permana on 26/03/23.
//

import UIKit

class HeaderTableCell: UITableViewCell {
    
    static let identifier = "HeaderTableCell"

    @IBOutlet weak var likedImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
