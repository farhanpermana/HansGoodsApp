//
//  ItemsTableCell.swift
//  HansGoodsApp
//
//  Created by Farhan on 24/03/23.
//

import UIKit

class ItemsTableCell: UITableViewCell {
    
    static let identifier = "ItemsTableCell"
    
    var imgItem: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    var titleItem: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    var priceItem: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    var categoryItem: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    var ratingItem: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    var cardStyle: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.layer.borderColor = UIColor.clear.cgColor
        view.layer.borderWidth = 0.0
        view.layer.cornerRadius = 0
        return view
    }()
    
    func setupConstraint() {
        self.addSubview(cardStyle)
        self.cardStyle.addSubview(imgItem)
        self.cardStyle.addSubview(titleItem)
        self.cardStyle.addSubview(priceItem)
        self.cardStyle.addSubview(categoryItem)
    }
    
    func setupImgItem() {
        self.imgItem.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.imgItem.topAnchor.constraint(equalTo: cardStyle.topAnchor, constant: 0),
            self.imgItem.leadingAnchor.constraint(equalTo: cardStyle.leadingAnchor, constant: 0),
            self.imgItem.bottomAnchor.constraint(equalTo: cardStyle.bottomAnchor, constant: 0),
            self.imgItem.widthAnchor.constraint(equalToConstant: 105)
            
        ])
        
    }
    
    func setupCardStyle() {
        self.cardStyle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.cardStyle.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            self.cardStyle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            self.cardStyle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            self.cardStyle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            
        ])
        self.cardStyle.backgroundColor = UIColor.white
        self.cardStyle.layer.shadowColor = UIColor.darkGray.cgColor
        self.cardStyle.layer.shadowOffset = CGSize(width: 1, height: 2 )
        self.cardStyle.layer.shadowRadius = 5
        self.cardStyle.layer.shadowOpacity = 0.5
    }
    
    func setupTitleItem() {
        self.titleItem.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.titleItem.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            self.titleItem.leadingAnchor.constraint(equalTo: self.imgItem.trailingAnchor, constant: 12),
            self.titleItem.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            self.titleItem.heightAnchor.constraint(equalToConstant: 20),
            
        ])
        self.titleItem.backgroundColor = UIColor.red
    }
    
    func setupPriceItem() {
        self.priceItem.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.priceItem.topAnchor.constraint(equalTo: titleItem.bottomAnchor, constant: 9.01),
            self.priceItem.leadingAnchor.constraint(equalTo: imgItem.trailingAnchor, constant: 12),
            
      
        ])
        self.priceItem.font = UIFont.boldSystemFont(ofSize: 12)
        self.priceItem.backgroundColor = UIColor.red
    }
    
    func catItem() {
        self.categoryItem.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.categoryItem.topAnchor.constraint(equalTo: cardStyle.topAnchor, constant: 4),
            self.categoryItem.trailingAnchor.constraint(equalTo: cardStyle.trailingAnchor, constant: -4)
            //        self.dateJamTangan.font = UIFont(name: "Roboto-Regular", size: 8)
        ])
        
        self.categoryItem.font = UIFont.systemFont(ofSize: 8)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}