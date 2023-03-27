//
//  DetailItemsViewModel.swift
//  HansGoodsApp
//
//  Created by Farhan Permana on 26/03/23.
//

import Foundation

protocol ApiServiceDetailProtocol {
    var urlString: String { get set }
    var bindItemData: ((DetailItemsModel?) -> ())? { get set }
    
    func fetchDetail()

}

class DetailItemsViewModel: ApiServiceDetailProtocol {
    // get data id from api
    private var apiService: ApiService?
    var urlString: String
    var bindItemData: ((DetailItemsModel?) -> ())?
    init(apiService: ApiService?, urlString: String) {
        self.apiService = apiService
        self.urlString = urlString
        if let urlString = URL(string: urlString) {
            self.apiService?.get(url: urlString)
        }
    fetchDetail()
    }
    
    func fetchDetail() {
        apiService?.callAPI(model: DetailItemsModel.self, completion: { response in
            switch response {
            case .success(let success):
                self.bindItemData?(success)
                print("sukses fetch detail")
            case .failure(_):
                self.bindItemData?(nil)
            }
        
        })
    
    }
}
