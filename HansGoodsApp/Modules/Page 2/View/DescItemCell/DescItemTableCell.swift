//
//  DescItemTableCell.swift
//  HansGoodsApp
//
//  Created by Farhan Permana on 26/03/23.
//

import UIKit

class DescItemTableCell: UITableViewCell {
    
    static let identifier = "DescItemTableCell"
    
    
    @IBOutlet weak var ratingsLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var catLabel: UILabel!
    
    // values label
    
    @IBOutlet weak var ratingsValue: UILabel!
    @IBOutlet weak var catValue: UILabel!
    @IBOutlet weak var descValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
