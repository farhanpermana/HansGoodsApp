//
//  ListItemsModel.swift
//  HansGoodsApp
//
//  Created by Farhan on 24/03/23.
//

import Foundation

struct ListItemsModel: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Ratings
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case description
        case category
        case image
        case rating
    }
}

struct Ratings: Codable {
    let rate: Double
    let count: Int
    
    enum CodingKeys: String, CodingKey {
        case rate
        case count
    }
}
