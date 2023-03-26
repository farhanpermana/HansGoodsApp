//
//  ListItemsViewModel.swift
//  HansGoodsApp
//
//  Created by Farhan on 24/03/23.
//

import Foundation

protocol ApiServiceItemsProtocol {
    var urlString: String { get set}
    var bindListData: (([ListItemsModel]?) -> ())? {get set}
    func fetchItem()
}

class ListItemsViewModel: ApiServiceItemsProtocol {
    
    private var apiService: ApiService?
    var data: [ListItemsModel]?
    var urlString: String
    var bindListData: (([ListItemsModel]?) -> Void)?
    init(urlString: String, apiService: ApiServiceProtocol){
        self.urlString = urlString
        self.apiService = apiService as? ApiService
        if let url = URL(string: urlString) {
            self.apiService?.get(url: url)
        }
        fetchItem()
    }
    
    func fetchItem() {
        self.apiService?.callAPI(model: [ListItemsModel]?.self, completion: { response in
            switch response {
            case .success(let success):
                self.bindListData?(success)
                print("sukses")
            case .failure(_):
                print("gagal")
                self.bindListData?(nil)
            }
        })
    }
    
    func numberOfRowsInSection() -> Int {
        return self.data?.count ?? 0
    }
}
