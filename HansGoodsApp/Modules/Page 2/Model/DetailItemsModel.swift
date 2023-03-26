//
//  DetailItemsModel.swift
//  HansGoodsApp
//
//  Created by Farhan Permana on 26/03/23.
//

import Foundation

struct DetailItemsModel: Codable {
    let id: Int
    let title: String
    let price: Double
    let description, category: String
    let image: String
    let rating: Rating
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}
