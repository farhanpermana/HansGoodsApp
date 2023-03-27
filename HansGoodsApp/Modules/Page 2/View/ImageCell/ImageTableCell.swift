//
//  TableViewCell.swift
//  HansGoodsApp
//
//  Created by Farhan Permana on 26/03/23.
//

import UIKit

class ImageTableCell: UITableViewCell {
    
    static let identifier = "ImageTableCell"

    @IBOutlet weak var imgLabel: UIImageView!
    
    @IBOutlet weak var opacityView: UIView!
    
    
    func setupCell() {
        opacityView.layer.backgroundColor = UIColor.black.withAlphaComponent(0.5).cgColor
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
