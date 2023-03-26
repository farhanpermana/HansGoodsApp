//
//  ItemTableViewCell.swift
//  HansGoodsApp
//
//  Created by Farhan Permana on 26/03/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    static let identifier = "ItemTableViewCell"
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblCategory: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
